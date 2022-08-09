import spacy
import warnings; warnings.simplefilter('ignore')
import pandas as pd
from spacy.symbols import amod, acomp, NOUN

def rules_adj_noun_pairs(doc):
    pairs = []
    for adjective in doc:
      if adjective.dep == amod or adjective.dep == acomp and adjective.head.pos == NOUN: # or adjective.dep == ccomp or adjective.dep == conj
        pairs.append(str(' '.join([adjective.text, adjective.head.lemma_])))
    return pairs

def extract_adj_noun_pairs(df, *args, **kwargs):

    nlp = spacy.load('en_core_web_sm', disable = ['tagger', 'ner', 'attribute_ruler'])
    
    if isinstance(df, pd.DataFrame):
      col = kwargs.get('col', None)
      keep = kwargs.get('keep', None)

      if keep == 'keep':
        df['parsed_text'] = [doc for doc in nlp.pipe(df[col].tolist())] # this turns into env
        df['adj_noun_pair'] = df['parsed_text'].apply(rules_adj_noun_pairs)
        df = df.loc[:, df.columns != 'parsed_text']
      else:
        df[col] = [doc for doc in nlp.pipe(df[col].tolist())] 
        df['adj_noun_pair'] = df[col].apply(rules_adj_noun_pairs)
        df = df.loc[:, df.columns == 'adj_noun_pair']

      df = df[df.astype(str)['adj_noun_pair'] != '[]']
      df = df.explode('adj_noun_pair')
    
    if isinstance(df, str):
      pass
    

    return(df)
