file_path = fopen('Test_text_file.txt', 'r');
string_text_file = fscanf(file_path, '%c'); %% %c to read each character and white space also
[probabilitiesarray,unique_characters]=return_desending_sorting_of_probability(string_text_file);
[huffman_cell,lengthofprobabilityarray,indexes] = Huffman_Encoding(probabilitiesarray) ; 

average_length_huffman_code= calculate_the_huffman_average_length_code(huffman_cell,lengthofprobabilityarray,indexes,probabilitiesarray);
entropy_huffman = calculate_entropy(probabilitiesarray);
huffman_efficency= calculate_efficiency(entropy_huffman,average_length_huffman_code);
[bit_per_symbol_fixed_length_code,efficency_of_fixed_length_code] = calculate_efficiency_of_fixed_codelength (probabilitiesarray);
efficency_of_fixed_length_code=efficency_of_fixed_length_code*100;

%% create table 



    unique_characters_desend = unique_characters(indexes);  
    unique_characters_desend=unique_characters_desend';
    
    probabilitiesarray_transpose = probabilitiesarray' ;
    
    codes_only=huffman_cell{:,3};
    codes_only=codes_only';
    ss = zeros(1,length(indexes));
   
    fprintf(' unique character     probability       code word     \n');
    fprintf('-----------------------------------------------------------\n');
    
    header={'unique character','probability','code word'}  ;
    %%table=  [unique_characters_desend(i,1) probabilitiesarray_transpose(i,1) codes_only(i,1)]; 
    final_table = table (unique_characters_desend(:,1),probabilitiesarray_transpose(:,1),codes_only(:,1));
    
    disp(final_table);
    
     
     
    


%% fprintf statements
fprintf('The number of bit/symbol needed to construct fixed length code is %d   \n',bit_per_symbol_fixed_length_code );
fprintf('The efficeny of fixed length code is %f  %% \n',efficency_of_fixed_length_code );
fprintf('The entropy of huffman code is %f   \n',entropy_huffman );
fprintf('The average huffman length code is %f   \n',average_length_huffman_code );
fprintf('The effienecy of huffman code is %f %%  \n',huffman_efficency );



