function [ key_points ] = eliminate_edge_responses( key_points, DoG, r )
%ELIMINATE_EDGE_RESPONSES Uses the hessian matrix to eliminate key ponts
%that lie on edges instead of corners.


for octave = 1:size(DoG,2)
    for scale = 2:size(DoG{1,1},3)-1
        indices = find(key_points{1,octave}(:,:,scale));
        for i = 1:size(indices)
            row = ceil(indices(i) / size(DoG{1,octave},2));
            col = mod(indices(i)-1, size(DoG{1,octave},2)) + 1;
            if row == 1 || row == size(DoG{1,octave},1) ...
                    || col == 1 || col == size(DoG{1,octave},2)
                key_points{1,octave}(row,col,scale) = false;
                continue;
            end
            patch = DoG{1,octave}(row-1:row+1, col-1:col+1,scale);
            [gx, gy] = gradient(patch);
            [gxx, gxy] = gradient(gx);
            [~, gyy] = gradient(gy);
            H = [gxx(2,2) gxy(2,2); 
                 gxy(2,2) gyy(2,2)];
                 
            if trace(H)^2 / det(H) > (r + 1)^2/r
                key_points{1,octave}(row,col,scale) = false;
            end
        end

    end
        
    
end

end

