function [Huffman_cell ,length_of_inputarray ,indexes]= Huffman_Encoding (array_with_desending_order_probability) 
    %% this function responsible for returning the final huffman cell
    %% it also return the length of input probability array . because we will need it when displaying the table
    
    copy_array = array_with_desending_order_probability; %% I take a copy to work on it 
    length_of_inputarray = length(array_with_desending_order_probability); %% length of input probability array which is 33 in our case 
    minimum = min(array_with_desending_order_probability);
    
    %% we will make a check on the input array
    
    if minimum < 0
        error ('Error the probability array can not contain negitive values');
        return
        
    else if sum(array_with_desending_order_probability) > 1
            error ('Error the sum of elements of probability array can not be greater than one ');
            return
    end
        
    %% create a cell which has same number of rows as the input probability array and three coulmns
    %% column for probability of source coding and column for index of these probability and coulmn for the code that we want 
    %% initalize the last column an empty until we fill it
    Huffman_cell = {length_of_inputarray,3};
    for fill = 1: length_of_inputarray
    Huffman_cell{fill,3} = {''};  %% last column for the code that we want
    Huffman_cell{fill,2} = fill;   
    Huffman_cell{fill,1} = copy_array(fill);   
         
       
    end
    
    
    %% now we will solve for huffman 
    %% in huffman code , we can predict the the first bit of code from left of the last 2 sources right ?
    %% as we make strcat "string contactation" of bits backward and everytime we stuck with 0 at left on the last code and 1 on the before last code
    
    for i=1:1:length_of_inputarray -1
        last = '0';
        before_last= '1';
        %% we want to add on it right so we will use a built in function called strcat 
        %% we can use blanks function ,, but strcat is good to avoid making spaces
        
        Huffman_cell{end, 3}=strcat(last , Huffman_cell{end, 3} );
        Huffman_cell{end-1, 3}=strcat(before_last , Huffman_cell{end-1, 3} );
        
        %% store the code on array also to save it 
        
        code_saving= [Huffman_cell{end, 3} , Huffman_cell{end-1, 3} ] ;
        
        %%  add the last two rows of first column (probabilities column)
        sum_last_two_probabilities = Huffman_cell{end,1} + Huffman_cell{end-1,1};
        %%  store these sum on an array 
        
        sum_array = sum_last_two_probabilities ;
        
        %% store the index of last two elements also 
        
        index_saving = [Huffman_cell{end, 2} , Huffman_cell{end-1, 2}];
        
        %% I will remove the last row 
        Huffman_cell = Huffman_cell(1: end-1,:);
        %% now fill the last row with our saved data with right order
        
        Huffman_cell( end,:) = {sum_array,index_saving , code_saving};
        
        % we finish now , but the last step is resort the probability with
        % desend order of probability
        
        Huffman_cell = sortrows(Huffman_cell , 1 , 'descend');
        
        
    end
    indexes=index_saving;

 
    
            
end
