import nltk
nltk.download('stopwords')
from nltk.corpus import stopwords
stopworda = set(stopwords.words('indonesian'))
import re
import pandas as pd

class CleanText():
    def __init__(self) -> None:
        self.df = pd.read_csv("scrape-panti-clean2.csv").drop(['Unnamed: 0'],axis=1)

    def clean_text(text):
        temp = text.lower()
        temp = re.sub("'", "", temp)
        temp = re.sub("@[A-Za-z0-9_]+","", temp)
        temp = re.sub("#[A-Za-z0-9_]+","", temp)
        temp = re.sub(r'http\S+', '', temp)
        temp = re.sub('[()!?]', ' ', temp)
        temp = re.sub('\[.*?\]',' ', temp)
        temp = re.sub("[^a-z0-9]"," ", temp)
        temp = temp.split()
        temp = [w for w in temp if not w in stopworda]
        temp = " ".join(word for word in temp)
        return temp

    def combine_text_need(text, needs):
        for need in needs:
            text = text + f" {need}"
        return text

    def clean_df(self):
        self.df['text_temp'] = self.df['Nama Panti'] + " " + self.df['Description_clean'] + " " + self.df['Kebutuhan_clean'] + " " + self.df['Program_clean']
        self.df['text'] = self.df.apply(lambda x: self.combine_text_need(x['text_temp'], x['Tag Kebutuhan']), axis=1)
        self.df.drop(['text_temp'], axis = 1, inplace=True)