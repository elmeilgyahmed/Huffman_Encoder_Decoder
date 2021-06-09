function Final_entropy = calculate_entropy(array_desending_order_of_probability)
    %% Here we will find the entropy 
    %% entropy = -P1log2(P1)-P2log2(p2)-P3log2(P3)- so on
    %% will use for loop and we will initialize entropy = 0
    entropy = 0 ; %initialize the entropy
    for i = 1: length(array_desending_order_of_probability)
        entropy=entropy - array_desending_order_of_probability(i) * log2(array_desending_order_of_probability(i)) ; 
        % here when i = 1 >> the entropy will equal 0-P1*log2(P1) which is
        % -P1 log2(P1) which is right 
        
    end
        Final_entropy = entropy;
    
end
