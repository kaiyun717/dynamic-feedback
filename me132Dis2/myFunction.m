function output = myFunction(displayString, input)
%UNTITLED2 Summary of this function goes here
%   Detailed explanation goes here
    
    disp(displayString);
    
    if ( input <= 2 )
        output = input .^ 2 + 3 * input - 10;
    else
        output = -input + 4;
end

