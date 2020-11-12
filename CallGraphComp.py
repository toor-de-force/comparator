import WL_Wrapper as w


class CallGraphComp(w.WL_Wrapper):
    def __init__(self,G1,G2,scheme):
        G1 = self.cleanup(G1)
        G2 = self.cleanup(G2)
        super().__init__(G1,G2,scheme)

    def clean_up_labels(self,g):
        for node in g.nodes:
            try:
                label = g.nodes[node]['label']
                label = label.replace("__","_")
                if label == '"{nd}"':
                    label = '"{rand}"'
                elif label == '"{_Z9path_goalv}"':
                    label = '"{verifier.error}"'
                elif '_Z' in label and 'func' in label:
                    temp = label.replace("{","")
                    temp = temp.replace("}","")
                    temp = temp.replace("\"","")
                    r = temp.find('func')
                    temp = temp[r:]
                    s = temp[4:]
                    s = s.replace("i","_int")
                    s = s.replace("b","_bool")
                    s = s.replace("c","_char")
                    label = '\"{sym.func'+s+'}\"'
                    pass
                elif 'sym.' in label:
                    label = label.replace("sym.","")
                g.nodes[node]['label'] = label
            except KeyError:
                pass
        return g

    def cleanup(self, graph):
        nodes = list(graph.nodes(data=True))
        for k, v in nodes:
            try:
                if "external" == v['label']:
                    graph.remove_node(k)
                elif "path_goal" in v['label']:
                    v['label'] = "{verifier.error}"
                elif "path_nongoal" in v['label']:
                    v['label'] = "{verifier.error}"
                elif "rand" in v['label']:
                    v['label'] = "{nd}"
                elif "path_start" in v['label']:
                    graph.remove_node(k)
                elif "time" in v['label']:
                    ins = [in_edge[0] for in_edge in graph.in_edges(k)]
                    outs = [out_edge[1] for out_edge in graph.out_edges(k)]
                    graph.remove_node(k)
                    for in_edge in ins:
                        for out_edge in outs:
                            graph.add_edge(in_edge, out_edge)
            except:
                graph.nodes[k]['label'] = "exit"

        nodes = graph.nodes(data=True)
        copies = [k for k, v in nodes if v['label'] == "{verifier.error}"]
        if len(copies) == 2:
            ins = [in_edge[0] for in_edge in graph.in_edges(copies[1])]
            outs = [out_edge[1] for out_edge in graph.out_edges(copies[1])]
            for out_edge in outs:
                if out_edge not in [o[1] for o in graph.out_edges(copies[0])]:
                    graph.add_edge(copies[0], out_edge)
            for in_edge in ins:
                if in_edge not in [i[0] for i in graph.in_edges(copies[0])]:
                    graph.add_edge(copies[0], in_edge)
            graph.remove_node(copies[1])
        return graph