import spacy
import warnings; warnings.simplefilter('ignore')
import pandas as pd

def extract_adj_noun_pairs(doc):
    pairs = []
    for subject in doc:
        if subject.dep_ == 'nsubj' or subject.dep_ == 'nsubjpass':
            for child in subject.children:
                if child.pos_ == 'ADJ':
                    adj_index = child.i

                    adj = doc[adj_index]
                    
                    # if not an empty iterator
                    _exhausted  = object()

                    if next(adj.children, _exhausted) is not _exhausted:

                        for c in adj.children:
                            if c.dep_ == 'neg':
                                pairs.append(str(' '.join([c.text, child.text, subject.text])))
                            else:
                                pairs.append(str(' '.join([child.text, subject.text])))
                    else:
                        pairs.append(str(' '.join([child.text, subject.text])))

    return pairs


def driver(hansard, col, **kwargs):

    nlp = spacy.load('en_core_web_sm')
    
    kw = kwargs.get('keep', None)
    
    #hansard = pd.read_csv('/home/stephbuon/data/sample_data/full_hansard_sample.csv')
    #hansard_small = hansard[['text', 'sentence_id']].copy()
    
    if kw == 'keep':
      hansard['parsed_text'] = [doc for doc in nlp.pipe(hansard[col].tolist())] # this turns into env
      hansard['adj_noun_pair'] = hansard['parsed_text'].apply(extract_adj_noun_pairs)
      hansard = hansard.loc[:, hansard.columns != 'parsed_text']
    else:
      hansard[col] = [doc for doc in nlp.pipe(hansard[col].tolist())] 
      hansard['adj_noun_pair'] = hansard[col].apply(extract_adj_noun_pairs)
      hansard = hansard.loc[:, hansard.columns == 'adj_noun_pair']

    hansard = hansard[hansard.astype(str)['adj_noun_pair'] != '[]']

    hansard = hansard.explode('adj_noun_pair')

    return(hansard)
    

#hansard = pd.read_csv('/home/stephbuon/projects/posextractr/posextract/debug.csv')
#hansard = driver(hansard, 'text')

#print(hansard)
