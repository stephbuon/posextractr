import spacy
import warnings; warnings.simplefilter('ignore')
import pandas as pd
from spacy.symbols import nsubj, nsubjpass, VERB

def extract_subj_verb_pairs(doc):
    pairs = []
    for subject in doc:
      if subject.dep == nsubj or subject.dep == nsubjpass and subject.head.pos == VERB: # or adjective.dep == ccomp or adjective.dep == conj
        pairs.append(str(' '.join([subject.text, subject.head.lemma_])))
      if subject.dep == nsubj or subject.dep == nsubjpass and subject.head.pos != VERB:
        for child in subject.children:
          if child.pos == VERB:
            pairs.append(str(' '.join([subject.text, child.lemma_])))
            
    return pairs

def driver(hansard, col, **kwargs):

    nlp = spacy.load('en_core_web_sm', disable = ['tagger', 'ner', 'attribute_ruler'])
    
    kw = kwargs.get('keep', None)
    
    if kw == 'keep':
      hansard['parsed_text'] = [doc for doc in nlp.pipe(hansard[col].tolist())] # this turns into env
      hansard['subj_verb_pair'] = hansard['parsed_text'].apply(extract_subj_verb_pairs)
      hansard = hansard.loc[:, hansard.columns != 'parsed_text']
    else:
      hansard[col] = [doc for doc in nlp.pipe(hansard[col].tolist())] 
      hansard['subj_verb_pair'] = hansard[col].apply(extract_subj_verb_pairs)
      hansard = hansard.loc[:, hansard.columns == 'subj_verb_pair']

    hansard = hansard[hansard.astype(str)['subj_verb_pair'] != '[]']

    hansard = hansard.explode('subj_verb_pair')

    return(hansard)
