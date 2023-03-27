import pandas as pd
pd.options.mode.chained_assignment = None
import numpy as np
from cos_similarity import CosineSimilarity
import random

class RecommendationSys:
    def __init__(self) -> None:
        self.df = pd.read_csv("data_panti_clean.csv").drop(['Unnamed: 0'], axis=1)
        self.cos_sim = CosineSimilarity.cosine_similarity_count(self.df['text'])

    def is_preference(self, pref, text):
        if pref in text:
            return 1
        return 0

    def get_panti_with_pref(self, preference):
        df_pref = self.df[['Jumlah Anak']]
        df_pref['Is Pref'] = self.df.apply(lambda row: self.is_preference(preference, row['text']), axis=1)
        df_pref.sort_values(by=['Is Pref', 'Jumlah Anak'], ascending=False, inplace=True)
        if len(df_pref[df_pref['Is Pref'] == 1]) < 10:
            return list(df_pref[df_pref['Is Pref'] == 1].index)
        return list(df_pref[:10].index)

    def get_recommendations_no_pref(self):
        id = [random.randint(0,100) for i in range(0,10)]
        sim_scores = []
        for idx in id:
            sim_scores = sim_scores + list(enumerate(self.cos_sim[idx]))
            sim_scores = sorted(sim_scores, key = lambda x: x[1], reverse = True)
            panti = [i[0] for i in sim_scores]
            panti_index = pd.unique(panti)
        return panti_index[len(id):len(id)+10]

    def get_recommendations(self, preferences):
        id = []
        for preference in preferences:
            id.extend(self.get_panti_with_pref(preference))
        sim_scores = []
        for idx in id:
            sim_scores = sim_scores + list(enumerate(self.cos_sim[idx]))
            sim_scores = sorted(sim_scores, key = lambda x: x[1], reverse = True)
            panti = [i[0] for i in sim_scores]
            panti_index = pd.unique(panti)
        return panti_index[len(id):len(id)+10]

    def get_recommendations_hist(self, preferences, history):
        id = []
        id.extend(history)
        for preference in preferences:
            id.extend(self.get_panti_with_pref(preference))
        id = pd.unique(id)
        sim_scores = []
        for idx in id:
            sim_scores = sim_scores + list(enumerate(self.cos_sim[idx]))
            sim_scores = sorted(sim_scores, key = lambda x: x[1], reverse = True)
            panti = [i[0] for i in sim_scores]
            panti_index = pd.unique(panti)
        return panti_index[len(id):len(id)+10]