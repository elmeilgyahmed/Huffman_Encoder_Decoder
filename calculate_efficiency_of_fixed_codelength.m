function [number_of_bitspersymbols,efficiency_fixed_code_length] = calculate_efficiency_of_fixed_codelength (array_desending_order_of_probability)
    number_of_bitspersymbols=round(log2(1/length(array_desending_order_of_probability)));%% finfinf the number of bits per symbol , the answer will decimal , so we use round function
    
    number_of_bitspersymbols=abs(number_of_bitspersymbols); %% get the positive value of bits per symbol 
    
    entropy_fixed_length = calculate_entropy(array_desending_order_of_probability); % efficiency = entropy / average length , we calculate entropy here 
    
    %% average length here is the same as the number of  bits per symbol
    efficiency_fixed_code_length = entropy_fixed_length/number_of_bitspersymbols; %% output 
end