clc
%tic;pkg install -forge symbolic;fprintf(1,['%.' num2str(2^6) 'f.\n'],toc);%

try
                try
                    
                tic;digits(2^15-2);fprintf(1,['%.' num2str(2^6) 'f.\n'],toc);
                
                tic
                vpa(1)...
                /...
                vpa(84.406022589954030768899117092091000289089388918088900852079)...
                *...
                vpa(3)...
                ^...
                vpa(9)
                fprintf(1,['%.' num2str(2^6) 'f.\n'],toc)
                        catch ME
                        tic;pkg load symbolic;fprintf(1,['%.' num2str(2^6) 'f.\n'],toc);
                end


        catch ME
        tic;fprintf(['%.' num2str(2^6) 'f\n'], 1 / 84.406022589954030768899117092091000289089388918088900852079 * 3^9);fprintf(1,['%.' num2str(2^6) 'f.\n'],toc);

        
end