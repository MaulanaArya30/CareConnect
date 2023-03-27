import pandas as pd
import numpy as np
from flask import Flask
import json
from sklearn.metrics.pairwise import cosine_similarity
from sklearn.feature_extraction.text import CountVectorizer
import random

app = Flask(__name__)

@app.route('/',methods=['GET','POST'])
def get_panti_index():
    df = pd.read_csv("/home/apporphan/mysite/data_panti_clean.csv").drop(['Unnamed: 0'], axis=1)
    df_text = df['text']
    count = CountVectorizer()
    count_matrix = count.fit_transform(df_text)
    cos_sim = cosine_similarity(count_matrix, count_matrix)
    id = [random.randint(0,393) for i in range(0,4)]
    sim_scores = []
    for idx in id:
        sim_scores = sim_scores + list(enumerate(cos_sim[idx]))
        sim_scores = sorted(sim_scores, key = lambda x: x[1], reverse = True)
        panti = [i[0] for i in sim_scores]
        panti_index = pd.unique(panti)
    panti = panti_index[len(id):len(id)+4]
    idn = [str(i) for i in panti]
    data_set = {'index':idn}
    return json.dumps(data_set)