function average_huffman_length_code = calculate_the_huffman_average_length_code (huffman_cell , length_of_array ,indexes , desending_array_probability)
    %% this function responsible for finding the average length code of the huffman length to be used 
    %% in the finding of the efficiency
    
    %% the input of this function is the output of the Huffman_Encoding function and the probability array
    desending_array_probability = (desending_array_probability (indexes))';
    average_huffman_length = 0 ; %% initialize the average length = 0
    codes_only=huffman_cell{:,3};
    codes_only=codes_only';
    
    for i=1:length_of_array
        average_huffman_length = average_huffman_length + (length(codes_only{i,1}) * desending_array_probability(i,1)) ;
    end
        
    average_huffman_length_code = average_huffman_length;
    
    
end