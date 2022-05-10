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


def driver(hansard):

    nlp = spacy.load('en_core_web_sm')
    
    #hansard = pd.read_csv('/home/stephbuon/data/sample_data/full_hansard_sample.csv')
    #hansard_small = hansard[['text', 'sentence_id']].copy()
    
    hansard_small['parsed_text'] = [doc for doc in nlp.pipe(hansard_small['text'].tolist())] # this turns into env

    hansard_small['adj_noun_pairs'] = hansard_small['parsed_text'].apply(extract_adj_noun_pairs)
    hansard_small = hansard_small.loc[:, hansard_small.columns != 'parsed_text']
    hansard_small = hansard_small[hansard_small.astype(str)['adj_noun_pairs'] != '[]']

    hansard_small = hansard_small.explode('adj_noun_pairs')

    return(hansard_small)
    
