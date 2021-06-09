function [array_with_desending_order_probability,unique_characters] = return_desending_sorting_of_probability(string_from_text_file)
    %% HERE will do the first step in huffman algorithm which is : sort probability of source code in desending order
    
    lenght_of_string_in_text_file=length(string_from_text_file); %%here we find the length of whole text file , we will use it later
    
    unique_characters=unique(string_from_text_file);  %%here we find the unique characters from the text file string which are 33 unique characters
    
    arrayofzeros=zeros(length(unique_characters));
    
    counting_of_each_unique_in_whole_string = histc(string_from_text_file,unique_characters); %% here we find the count of each unique character in the whole string
    
    Probability_of_each_unique_character = counting_of_each_unique_in_whole_string / lenght_of_string_in_text_file; 
    
    arrayofzeros = sort (Probability_of_each_unique_character,'descend'); %% this the output 
    
    array_with_desending_order_probability=arrayofzeros;
end