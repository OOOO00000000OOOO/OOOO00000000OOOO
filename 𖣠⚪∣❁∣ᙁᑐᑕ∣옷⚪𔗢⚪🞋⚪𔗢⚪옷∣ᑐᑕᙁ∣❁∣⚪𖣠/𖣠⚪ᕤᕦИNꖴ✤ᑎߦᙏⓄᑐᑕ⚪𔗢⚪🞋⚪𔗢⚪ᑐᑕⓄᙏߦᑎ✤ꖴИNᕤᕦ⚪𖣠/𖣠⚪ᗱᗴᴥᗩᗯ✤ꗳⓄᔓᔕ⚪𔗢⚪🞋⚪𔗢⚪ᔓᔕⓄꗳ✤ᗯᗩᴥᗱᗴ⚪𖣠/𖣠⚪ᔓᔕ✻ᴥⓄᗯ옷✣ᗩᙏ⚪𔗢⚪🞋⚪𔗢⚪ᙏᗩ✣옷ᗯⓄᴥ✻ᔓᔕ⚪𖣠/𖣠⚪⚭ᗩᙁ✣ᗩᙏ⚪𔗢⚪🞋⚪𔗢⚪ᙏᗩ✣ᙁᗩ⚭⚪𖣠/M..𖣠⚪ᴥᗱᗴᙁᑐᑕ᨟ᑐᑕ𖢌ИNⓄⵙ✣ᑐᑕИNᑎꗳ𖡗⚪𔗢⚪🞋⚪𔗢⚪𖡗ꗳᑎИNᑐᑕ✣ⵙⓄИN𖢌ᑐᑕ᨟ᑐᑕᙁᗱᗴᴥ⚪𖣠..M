clc;tic;clf;clear;set(0,'DefaultFIGUREWINDOWSTYLE','DOCKED');
syms X

O_YTITNAUQ_TNIOP_TOLP_O_PLOT_POINT_QUANTITY_O=1+                ((((                2^8                ))))                ;
O_EGNAR_X_O_X_RANGE_O=                ((((                -2                ))))                :                1/(O_YTITNAUQ_TNIOP_TOLP_O_PLOT_POINT_QUANTITY_O-1)                :                ((((                2                ))))                ;

O_ALUMROF_O_FORMULA_O=@(X)                ((((                X.^3.35                ))))                ;
%O_ALUMROF_O_FORMULA_O=@(X)                ((((                1./(exp(1./X + 1./(X - 1)) + 1)                ))))                ;                %
%O_ALUMROF_O_FORMULA_O=@(X)                ((((                .5.*(1+tanh((.5-X)./((-1+X).*X)))                ))))                ;                %
%O_ALUMROF_O_FORMULA_O=@(X)                ((((                ((-32.*(max(0,-15./16+X).^3-max(0,-13./16+X).^3-max(0,-11./16+X).^3+max(0,-9./16+X).^3-max(0,-7./16+X).^3+max(0,-5./16+X).^3+max(0,-3./16+X).^3-max(0,-1./16+X).^3))./3)                ))))                ;                %
fprintf('%s\n',O_ALUMROF_O_FORMULA_O(X));
fprintf('%s\n',simplify(expand(O_ALUMROF_O_FORMULA_O(X),"IGNOREANALYTICCONSTRAINTS",true),"STEPS",16,"CRITERION","PREFERREAL","IGNOREANALYTICCONSTRAINTS",true));

O_TFIHS_THGIEH_O_HEIGHT_SHIFT_O_HEIGHT_SHIFT_O=                ((((                .5                ))))                ;
O_SIXA_X_GNOLA_GNILCYC_LACITREW_O_WERTICAL_CYCLING_ALONG_X_AXIS_O=@(X)(-1).^floor(X).*(O_ALUMROF_O_FORMULA_O(mod(X,1))-O_TFIHS_THGIEH_O_HEIGHT_SHIFT_O_HEIGHT_SHIFT_O)+O_TFIHS_THGIEH_O_HEIGHT_SHIFT_O_HEIGHT_SHIFT_O;
fprintf('\n%s\n',O_SIXA_X_GNOLA_GNILCYC_LACITREW_O_WERTICAL_CYCLING_ALONG_X_AXIS_O(X));
fprintf('%s\n',simplify(expand(O_SIXA_X_GNOLA_GNILCYC_LACITREW_O_WERTICAL_CYCLING_ALONG_X_AXIS_O(X),"IGNOREANALYTICCONSTRAINTS",true),"STEPS",16,"CRITERION","PREFERREAL","IGNOREANALYTICCONSTRAINTS",true));

O_SIXA_X_GNOLA_GNILCYC_LATNOZIROH_O_HORIZONTAL_CYCLING_ALONG_X_AXIS_O=@(X)O_ALUMROF_O_FORMULA_O(mod(X,1)).*(mod(floor(X+1),2))+O_ALUMROF_O_FORMULA_O(1-mod(X,1)).*(mod(floor(-X+1),2));
fprintf('\n%s\n',O_SIXA_X_GNOLA_GNILCYC_LATNOZIROH_O_HORIZONTAL_CYCLING_ALONG_X_AXIS_O(X));
fprintf('%s\n',simplify(expand(O_SIXA_X_GNOLA_GNILCYC_LATNOZIROH_O_HORIZONTAL_CYCLING_ALONG_X_AXIS_O(X),"IGNOREANALYTICCONSTRAINTS",true),"STEPS",16,"CRITERION","PREFERREAL","IGNOREANALYTICCONSTRAINTS",true));

figure(gcf);
subplot(3,1,1);
plot(O_EGNAR_X_O_X_RANGE_O, O_ALUMROF_O_FORMULA_O(O_EGNAR_X_O_X_RANGE_O));
xlim([-2 2]);ylim([-1 1]);
pbaspect([4 1 1])
subplot(3,1,2);
plot(O_EGNAR_X_O_X_RANGE_O, O_SIXA_X_GNOLA_GNILCYC_LACITREW_O_WERTICAL_CYCLING_ALONG_X_AXIS_O(O_EGNAR_X_O_X_RANGE_O));
xlim([-2 2]);ylim([-1 1]);
pbaspect([4 1 1])
subplot(3,1,3);
plot(O_EGNAR_X_O_X_RANGE_O, O_SIXA_X_GNOLA_GNILCYC_LATNOZIROH_O_HORIZONTAL_CYCLING_ALONG_X_AXIS_O(O_EGNAR_X_O_X_RANGE_O));
xlim([-2 2]);ylim([-1 1]);
pbaspect([4 1 1])

fprintf(1,['\n\n%.' num2str(2^6) 'f\n'],toc);