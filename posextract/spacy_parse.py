import spacy
import warnings; warnings.simplefilter('ignore')
import pandas as pd
from spacy.symbols import amod, acomp, NOUN

def driver(hansard, col, **kwargs):

    nlp = spacy.load('en_core_web_sm', disable = ['tagger', 'ner', 'attribute_ruler'])
    
    kw = kwargs.get('keep', None)
    
    if kw == 'keep':
      hansard['parsed_text'] = [doc for doc in nlp.pipe(hansard[col].tolist())] # this turns into env
    else:
      hansard[col] = [doc for doc in nlp.pipe(hansard[col].tolist())] 

    return(hansard)