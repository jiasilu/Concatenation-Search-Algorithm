# ConcatenateWordsWithTrie

======================
Programming Problem - Find Longest Word Made of Other Words
======================

Write a program that reads a file containing a sorted list of words (one word per line, no spaces, all lower case), then identifies the longest word in the file that can be constructed by concatenating copies of shorter words also found in the file.

For example, if the file contained:

       cat
       cats
       catsdogcats
       catxdogcatsrat
       dog
       dogcatsdog
       hippopotamuses
       rat
       ratcatdogcat

The answer would be 'ratcatdogcat' - at 12 letters, it is the longest word made up of other words in the list.  The program should then go on to report how many of the words in the list can be constructed of other words in the list.

## How it works

Install it yourself as:

    $ gem install concatenate_words_with_trie

In your project you can create a Concatenate Words object first.

    list = ConcatenateWords.new

Load the file that contains concatenated words.

    list.read_file("words_for_problem.txt")

Search for the longest concatenated word from the list.

    list.scan_longest_concat_word

Once finish searching, the longest concatenated word and the total number of concatenated words will be printed out.

## Approach to solve the problem

1.Since we're dealing with a very long list of strings and trying to find concatenation of words, and
  look up of keys in a trie data structure is faster than BST. Because worst case scenario takes O(m) time
  (if the length of key is m) for trie while BST takes O(m log n) time. I use fast_trie gem for trie.
  
2.Since we're looking for the longest word in the list, sort the list by the length of word by
  descending order will be the fastest to find the longest word.
  
3.I'll keep a hash table for those words checked in the trie, and pair each key with the value 
  whether it's a concatenated word or not. This will ensure we only check each word once, make it 
  more efficient.
  
4.For the main function - find_concat_words, I use recursive and divide-and-conquer solutions to
  iterate the word from the first character to the last.

    For example, we've a list of words:
       "ratcatdog"
       "rat"
       "cat"
       "dog"
    We are scanning "ratcatdog":
       'r' -> is not in trie, continue
       'ra' -> is not in trie, continue
       'rat' ->  is in tree, (check that 'rat' is not in the hash table, insert {'rat':true} into the table), then        check the rest of the word "catdog"
       'c' -> is not in trie, continue
       'ca' -> is not in trie, continue
       'cat' -> is in trie,  (check that 'cat' is not in the hash table, insert {'cat':true} into the table), then check the rest of the word "dog"
       'd' -> is not in trie, continue
       'do' -> is not in trie, continue
       'dog' -> is in trie, (check that 'dog' is not in the hash table, insert {'dog':true} into the table), reach the end, return true and increase total concatenated words count.


