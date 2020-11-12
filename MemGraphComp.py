import networkx as nx
import WL_Wrapper as w
class MemGraphCompare(w.WL_Wrapper):
    def __init__(self,G1, G2,scheme):

        G1 = self.clean_up(G1)
        G2 = self.clean_up(G2)
        super().__init__(G1,G2,scheme)
    def clean_up(self,g):

        for node in g.nodes:
            try:
                label = g.nodes[node]['label']
                if "{" in label:
                    pass # we want to keep the mem graph descriptor nodes
                else:
                    label = '0' # we can throw away other names
                g.nodes[node]['label'] = label
            except KeyError:
                pass
        return g