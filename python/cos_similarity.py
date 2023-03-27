import numpy as np
import pandas as pd
from sklearn.metrics.pairwise import cosine_similarity
from sklearn.feature_extraction.text import TfidfVectorizer
from sklearn.feature_extraction.text import CountVectorizer
import random


class CosineSimilarity:
    def __init__(self) -> None:
        pass

    def cosine_similarity_tfidf(df_text):
        tf = TfidfVectorizer(analyzer='word', ngram_range=(1,3), min_df=0)
        tfidf_matrix = tf.fit_transform(df_text)

        cos_sim = cosine_similarity(tfidf_matrix, tfidf_matrix)
        return cos_sim

    def cosine_similarity_count(df_text):
        count = CountVectorizer()
        count_matrix = count.fit_transform(df_text)

        cos_sim = cosine_similarity(count_matrix, count_matrix)
        return cos_sim