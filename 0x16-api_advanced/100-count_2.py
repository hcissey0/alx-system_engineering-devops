#!/usr/bin/python3
"""
This script is used to count the keywords in subreddit
"""

import requests
import re


def count_words(subreddit, word_list, count=None, after=None):
    """
    This fucntion is used to count the workds in
    a subreddit
    """
    if count is None:
        count = {word.lower(): 0 for word in word_list}

    url = f"https://www.reddit.com/r/{subreddit}/hot.json"
    headers = {"User-Agent": "My-Reddit-Script"}
    params = {"limit": 100, 'after': after}
    response = requests.get(url, headers=headers,
                            params=params,
                            allow_redirects=False)
    if response.status_code != 200:
        return None
    data = response.json().get('data')
    for post in data.get('children'):
        title = post.get('data').get('title').lower().split()
        for word in [w.lower() for w in word_list]:
            count[word] += len([i for i in title if i == word])
#        for word in title:
#            if word in [w.lower() for w in word_list]:
#                count[word] += 1

    if data.get('after') is not None:
        count_words(subreddit, word_list,
                    count, data.get('after'))
    else:
        sorted_count = sorted([(k, v)
                               for k, v in count.items()
                               if v > 0],
                              key=lambda x: (-x[1], x[0]))
        for w, c in sorted_count:
            print(f'{w}: {c}')
