%%%%% Function for highlighting states in the heatmap %%%%%
function [ ] = highlight_states( states, state_index )
    hold on;
    stepSize = 0.81/51;
    y = 1 - (stepSize*states(1,1) + 0.08);
    % Position for textbox is given by [x y w h]
    a = annotation('textbox', [0.14 y 0.2 stepSize]);
    % State with Highest and Lowest strength
    stateName = state_index(1,states(1));
    set(a, 'EdgeColor', 'White', 'String', stateName{1}, 'Color', 'White', 'HorizontalAlignment', 'Right', 'VerticalAlignment', 'middle', 'FontWeight', 'demi', 'LineWidth', 1, 'FontSize', 9);
    annotation('ellipse', [0.2 y 0.02 stepSize],'Color','red','EdgeColor','red','FaceColor','red');
    neighbors = states(1, 2:size(states,2));
    for s=1:size(neighbors,2)
        y = 1 - (stepSize*neighbors(1,s) + 0.08);
        a = annotation('textbox', [0.14 y 0.2 stepSize]);
        stateName = state_index(1,neighbors(1, s));
        set(a, 'EdgeColor', 'White', 'String', stateName{1}, 'Color', 'White', 'HorizontalAlignment', 'Right', 'VerticalAlignment', 'middle', 'FontWeight', 'demi', 'LineWidth', 1, 'FontSize', 9);
        
    end
end

