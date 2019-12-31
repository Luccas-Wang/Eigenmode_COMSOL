function out = model
%
% Li017_air.m
%
% Model exported on May 16 2019, 20:49 by COMSOL 5.4.0.225.

import com.comsol.model.*
import com.comsol.model.util.*

model = ModelUtil.create('Model');

model.modelPath('C:\Users\wangq\OneDrive\Documents\Comsol');

model.label('Li017_air.mph');

model.param.set('k', '0.5', '0-3 spans irreducible Brillouin zone (0-1 horizontal, 1-2 vertical, 2-3 diagonal)');
model.param.set('L1', '0.01[m]', 'Periodic cell length');
model.param.set('L2', 'L1/2.5', 'Size of inner material');
model.param.set('kx', 'if(k<1,pi/L1*k,if(k<2,pi/L1,(3-k)*pi/L1))', 'X component of wave number');
model.param.set('ky', 'if(k<1,0,if(k<2,(k-1)*pi/L1,(3-k)*pi/L1))', 'Y component of wave number');
model.param.set('E1', '1000[Pa]', 'Modulus of Material 1');
model.param.set('E2', '1.9e9[Pa]', 'Modulus of Material 2');
model.param.set('Rho1', '1.293[kg/m^3]', 'Density of Material 1');
model.param.set('Rho2', '1.099e3[kg/m^3]', 'Density of Material 2');
model.param.set('Poisson1', '0', 'Poisson ratio of Material 1');
model.param.set('Poisson2', '0.34', 'Poisson ratio of Material 2');
model.param.set('Shearcomp1', 'E1/2/(1+Poisson1)', 'Shear modulus of Material 1');
model.param.set('Factor1', 'L1/sqrt(Shearcomp1/Rho1)', 'Frequency normalization factor');

model.component.create('comp1', false);

model.component('comp1').geom.create('geom1', 2);

model.component('comp1').label('Model 1');

model.component('comp1').defineLocalCoord(false);

model.component('comp1').mesh.create('mesh1');

model.component('comp1').geom('geom1').repairTolType('relative');
model.component('comp1').geom('geom1').create('r1', 'Rectangle');
model.component('comp1').geom('geom1').feature('r1').active(false);
model.component('comp1').geom('geom1').feature('r1').set('size', [0.035 0.035]);
model.component('comp1').geom('geom1').create('r2', 'Rectangle');
model.component('comp1').geom('geom1').feature('r2').set('pos', {'0.0175[m]' '0.0175[m]'});
model.component('comp1').geom('geom1').feature('r2').set('base', 'center');
model.component('comp1').geom('geom1').feature('r2').set('size', {'0.035[m]' '0.001[m]'});
model.component('comp1').geom('geom1').create('r3', 'Rectangle');
model.component('comp1').geom('geom1').feature('r3').set('pos', {'0.0175[m]' '0.0175[m]'});
model.component('comp1').geom('geom1').feature('r3').set('base', 'center');
model.component('comp1').geom('geom1').feature('r3').set('size', {'0.001[m]' '0.035[m]'});
model.component('comp1').geom('geom1').create('r4', 'Rectangle');
model.component('comp1').geom('geom1').feature('r4').set('pos', {'0.0175[m]' '0.0175[m]'});
model.component('comp1').geom('geom1').feature('r4').set('rot', 45);
model.component('comp1').geom('geom1').feature('r4').set('base', 'center');
model.component('comp1').geom('geom1').feature('r4').set('size', {'0.02796[m]' '0.00063[m]'});
model.component('comp1').geom('geom1').create('r5', 'Rectangle');
model.component('comp1').geom('geom1').feature('r5').set('pos', {'0.0175[m]' '0.0175[m]'});
model.component('comp1').geom('geom1').feature('r5').set('rot', -45);
model.component('comp1').geom('geom1').feature('r5').set('base', 'center');
model.component('comp1').geom('geom1').feature('r5').set('size', {'0.02796[m]' '0.00063[m]'});
model.component('comp1').geom('geom1').create('r6', 'Rectangle');
model.component('comp1').geom('geom1').feature('r6').set('pos', {'0.0175[m]' '0.0175[m]'});
model.component('comp1').geom('geom1').feature('r6').set('rot', -45);
model.component('comp1').geom('geom1').feature('r6').set('base', 'center');
model.component('comp1').geom('geom1').feature('r6').set('size', {'0.005[m]' '0.005[m]'});
model.component('comp1').geom('geom1').create('mov1', 'Move');
model.component('comp1').geom('geom1').feature('mov1').set('displx', '-0.01165[m]');
model.component('comp1').geom('geom1').feature('mov1').set('disply', '0.01165[m]');
model.component('comp1').geom('geom1').feature('mov1').selection('input').set({'r6'});
model.component('comp1').geom('geom1').create('mir1', 'Mirror');
model.component('comp1').geom('geom1').feature('mir1').set('keep', true);
model.component('comp1').geom('geom1').feature('mir1').set('pos', {'0.0175[m]' '0.0175[m]'});
model.component('comp1').geom('geom1').feature('mir1').selection('input').set({'mov1'});
model.component('comp1').geom('geom1').create('mir2', 'Mirror');
model.component('comp1').geom('geom1').feature('mir2').set('keep', true);
model.component('comp1').geom('geom1').feature('mir2').set('pos', {'0.0175[m]' '0.0175[m]'});
model.component('comp1').geom('geom1').feature('mir2').set('axis', [0 1]);
model.component('comp1').geom('geom1').feature('mir2').selection('input').set({'mir1' 'mov1'});
model.component('comp1').geom('geom1').create('uni1', 'Union');
model.component('comp1').geom('geom1').feature('uni1').set('selresult', true);
model.component('comp1').geom('geom1').feature('uni1').set('color', '2');
model.component('comp1').geom('geom1').feature('uni1').set('intbnd', false);
model.component('comp1').geom('geom1').feature('uni1').selection('input').set({'mir1' 'mir2' 'mov1' 'r2' 'r3' 'r4' 'r5'});
model.component('comp1').geom('geom1').run;
model.component('comp1').geom('geom1').run('fin');

model.component('comp1').selection.create('sel1', 'Explicit');
model.component('comp1').selection('sel1').geom('geom1', 1);
model.component('comp1').selection('sel1').set([19 21]);
model.component('comp1').selection.create('sel2', 'Explicit');
model.component('comp1').selection('sel2').geom('geom1', 1);
model.component('comp1').selection('sel2').set([1 40]);
model.component('comp1').selection('sel1').label('solid_dst_pc1');
model.component('comp1').selection('sel2').label('solid_dst_pc2');

model.component('comp1').material.create('mat1', 'Common');
model.component('comp1').material.create('mat2', 'Common');
model.component('comp1').material('mat1').selection.set([]);
model.component('comp1').material('mat2').selection.set([1]);

model.component('comp1').physics.create('solid', 'SolidMechanics', 'geom1');
model.component('comp1').physics('solid').create('pc1', 'PeriodicCondition', 1);
model.component('comp1').physics('solid').feature('pc1').selection.set([1 40]);
model.component('comp1').physics('solid').feature('pc1').create('dd1', 'DestinationDomains', 1);
model.component('comp1').physics('solid').feature('pc1').feature('dd1').selection.set([40]);
model.component('comp1').physics('solid').create('pc2', 'PeriodicCondition', 1);
model.component('comp1').physics('solid').feature('pc2').selection.set([19 21]);
model.component('comp1').physics('solid').feature('pc2').create('dd1', 'DestinationDomains', 1);
model.component('comp1').physics('solid').feature('pc2').feature('dd1').selection.set([21]);

model.component('comp1').mesh('mesh1').create('ftri1', 'FreeTri');

model.component('comp1').view('view1').axis.set('xmin', -0.006589058320969343);
model.component('comp1').view('view1').axis.set('xmax', 0.04220379889011383);
model.component('comp1').view('view1').axis.set('ymin', -0.0030814518686383963);
model.component('comp1').view('view1').axis.set('ymax', 0.03879711776971817);

model.component('comp1').material('mat1').propertyGroup('def').set('youngsmodulus', 'E1');
model.component('comp1').material('mat1').propertyGroup('def').set('poissonsratio', 'Poisson1');
model.component('comp1').material('mat1').propertyGroup('def').set('density', 'Rho1');
model.component('comp1').material('mat2').propertyGroup('def').set('youngsmodulus', 'E2');
model.component('comp1').material('mat2').propertyGroup('def').set('poissonsratio', 'Poisson2');
model.component('comp1').material('mat2').propertyGroup('def').set('density', 'Rho2');

model.component('comp1').physics('solid').prop('ShapeProperty').set('order_displacement', 2);
model.component('comp1').physics('solid').feature('lemm1').set('minput_strainreferencetemperature', 0);
model.component('comp1').physics('solid').feature('lemm1').label('Linear Elastic Material Model 1');
model.component('comp1').physics('solid').feature('pc1').set('PeriodicType', 'Floquet');
model.component('comp1').physics('solid').feature('pc1').set('kFloquet', {'kx'; 'ky'; '0'});
model.component('comp1').physics('solid').feature('pc2').set('PeriodicType', 'Floquet');
model.component('comp1').physics('solid').feature('pc2').set('kFloquet', {'kx'; 'ky'; '0'});

model.component('comp1').mesh('mesh1').feature('size').set('hauto', 3);
model.component('comp1').mesh('mesh1').run;

model.study.create('std');
model.study('std').create('param1', 'Parametric');
model.study('std').create('eig', 'Eigenfrequency');
model.study('std').feature('eig').set('activate', {'solid' 'on'});

model.sol.create('sol1');
model.sol('sol1').study('std');
model.sol('sol1').attach('std');
model.sol('sol1').create('st1', 'StudyStep');
model.sol('sol1').create('v1', 'Variables');
model.sol('sol1').create('e1', 'Eigenvalue');
model.sol.create('sol2');
model.sol('sol2').study('std');
model.sol('sol2').label('Parametric Solutions 1');

model.batch.create('p1', 'Parametric');
model.batch('p1').create('so1', 'Solutionseq');
model.batch('p1').study('std');

model.result.dataset.create('dset7', 'Solution');
model.result.dataset('dset7').set('solution', 'sol2');
model.result.evaluationGroup.create('stdEvgFrq', 'EvaluationGroup');
model.result.evaluationGroup('stdEvgFrq').set('rowstructure', []);
model.result.evaluationGroup('stdEvgFrq').create('gev1', 'EvalGlobal');
model.result.create('pg7', 'PlotGroup1D');
model.result.create('pg8', 'PlotGroup2D');
model.result('pg7').set('data', 'dset7');
model.result('pg7').create('glob1', 'Global');
model.result('pg8').create('surf1', 'Surface');
model.result('pg8').feature('surf1').create('def', 'Deform');
model.result.export.create('img2', 'Image1D');
model.result.export.create('img3', 'Image2D');

model.study('std').label('Study 1');
model.study('std').feature('param1').set('pname', {'k'});
model.study('std').feature('param1').set('plistarr', {'range(0,3/36,3)'});
model.study('std').feature('param1').set('punit', {''});
model.study('std').feature('eig').set('neigs', 8);
model.study('std').feature('eig').set('neigsactive', true);
model.study('std').feature('eig').set('shift', '0');
model.study('std').feature('eig').set('discretization', {'solid' 'physics'});

model.sol('sol1').attach('std');
model.sol('sol1').feature('e1').set('transform', 'eigenfrequency');
model.sol('sol1').feature('e1').set('neigs', 8);
model.sol('sol1').runAll;

model.batch('p1').set('pname', {'k'});
model.batch('p1').set('plistarr', {'range(0,3/36,3)'});
model.batch('p1').set('punit', {''});
model.batch('p1').set('err', true);
model.batch('p1').feature('so1').set('seq', 'sol1');
model.batch('p1').feature('so1').set('store', true);
model.batch('p1').feature('so1').set('psol', 'sol2');
model.batch('p1').feature('so1').set('param', {'"k","0"' '"k","0.0833333333333333"' '"k","0.166666666666667"' '"k","0.25"' '"k","0.333333333333333"' '"k","0.416666666666667"' '"k","0.5"' '"k","0.583333333333333"' '"k","0.666666666666667"' '"k","0.75"'  ...
'"k","0.833333333333333"' '"k","0.916666666666667"' '"k","1"' '"k","1.08333333333333"' '"k","1.16666666666667"' '"k","1.25"' '"k","1.33333333333333"' '"k","1.41666666666667"' '"k","1.5"' '"k","1.58333333333333"'  ...
'"k","1.66666666666667"' '"k","1.75"' '"k","1.83333333333333"' '"k","1.91666666666667"' '"k","2"' '"k","2.08333333333333"' '"k","2.16666666666667"' '"k","2.25"' '"k","2.33333333333333"' '"k","2.41666666666667"'  ...
'"k","2.5"' '"k","2.58333333333333"' '"k","2.66666666666667"' '"k","2.75"' '"k","2.83333333333333"' '"k","2.91666666666667"' '"k","3"'});
model.batch('p1').attach('std');
model.batch('p1').run;

model.result.evaluationGroup('stdEvgFrq').label('Eigenfrequencies (Study 1)');
model.result.evaluationGroup('stdEvgFrq').feature('gev1').set('expr', {'freq*2*pi' 'imag(freq)/abs(freq)' 'abs(freq)/imag(freq)/2'});
model.result.evaluationGroup('stdEvgFrq').feature('gev1').set('unit', {'rad/s' '1' '1'});
model.result.evaluationGroup('stdEvgFrq').feature('gev1').set('descr', {'Angular frequency' 'Damping ratio' 'Quality factor'});
model.result.evaluationGroup('stdEvgFrq').feature('gev1').set('const', {'solid.refpntx' '0' 'Reference point for moment computation, x coordinate'; 'solid.refpnty' '0' 'Reference point for moment computation, y coordinate'; 'solid.refpntz' '0' 'Reference point for moment computation, z coordinate'});
model.result.evaluationGroup('stdEvgFrq').run;
model.result('pg7').label('Phononic Band Structure');
model.result('pg7').set('titletype', 'manual');
model.result('pg7').set('title', 'Phononic Band Diagram');
model.result('pg7').set('xlabel', 'Parameter, k, spanning irreducible Brillouin zone');
model.result('pg7').set('xlabelactive', true);
model.result('pg7').set('ylabel', 'Frequency (Hz)');
model.result('pg7').set('ylabelactive', true);
model.result('pg7').set('showgrid', false);
model.result('pg7').feature('glob1').set('expr', {'solid.freq'});
model.result('pg7').feature('glob1').set('unit', {'Hz'});
model.result('pg7').feature('glob1').set('descr', {'Frequency'});
model.result('pg7').feature('glob1').set('const', {'solid.refpntx' '0' 'Reference point for moment computation, x coordinate'; 'solid.refpnty' '0' 'Reference point for moment computation, y coordinate'; 'solid.refpntz' '0' 'Reference point for moment computation, z coordinate'});
model.result('pg7').feature('glob1').set('xdatasolnumtype', 'outer');
model.result('pg7').feature('glob1').set('xdata', 'expr');
model.result('pg7').feature('glob1').set('xdataexpr', 'k');
model.result('pg7').feature('glob1').set('linewidth', 2);
model.result('pg7').feature('glob1').set('legendmethod', 'manual');
model.result('pg7').feature('glob1').set('legends', {'Solution 1' 'Solution 2' 'Solution 3' 'Solution 4' 'Solution 5' 'Solution 6' 'Solution 7' 'Solution 8'});
model.result('pg7').feature('glob1').set('xdatadescr', '');
model.result('pg8').label('Mode Shape (solid)');
model.result('pg8').set('looplevel', [6]);
model.result('pg8').set('inherithide', true);
model.result('pg8').set('showlegends', false);
model.result('pg8').feature('surf1').set('const', {'solid.refpntx' '0' 'Reference point for moment computation, x coordinate'; 'solid.refpnty' '0' 'Reference point for moment computation, y coordinate'; 'solid.refpntz' '0' 'Reference point for moment computation, z coordinate'});
model.result('pg8').feature('surf1').set('colortable', 'AuroraBorealis');
model.result('pg8').feature('surf1').set('resolution', 'normal');
model.result('pg8').feature('surf1').feature('def').set('scale', 9.910630540697204E-4);
model.result('pg8').feature('surf1').feature('def').set('scaleactive', false);
model.result.export('img2').set('pngfilename', 'C:\Users\wangq\OneDrive\Documents\Comsol\Li_1.png');
model.result.export('img2').set('logo', false);
model.result.export('img2').set('printunit', 'mm');
model.result.export('img2').set('webunit', 'px');
model.result.export('img2').set('printheight', '90');
model.result.export('img2').set('webheight', '600');
model.result.export('img2').set('printwidth', '210');
model.result.export('img2').set('webwidth', '800');
model.result.export('img2').set('printlockratio', 'off');
model.result.export('img2').set('weblockratio', 'off');
model.result.export('img2').set('printresolution', '300');
model.result.export('img2').set('webresolution', '96');
model.result.export('img2').set('size', 'current');
model.result.export('img2').set('antialias', 'on');
model.result.export('img2').set('zoomextents', 'off');
model.result.export('img2').set('title', 'on');
model.result.export('img2').set('legend', 'on');
model.result.export('img2').set('logo', 'off');
model.result.export('img2').set('options', 'on');
model.result.export('img2').set('fontsize', '9');
model.result.export('img2').set('customcolor', [1 1 1]);
model.result.export('img2').set('background', 'color');
model.result.export('img2').set('axes', 'on');
model.result.export('img2').set('showgrid', 'off');
model.result.export('img2').set('qualitylevel', '92');
model.result.export('img2').set('qualityactive', 'off');
model.result.export('img2').set('imagetype', 'png');
model.result.export('img3').set('pngfilename', 'C:\Users\wangq\OneDrive\Documents\Comsol\Li_3_c.png');
model.result.export('img3').set('printunit', 'mm');
model.result.export('img3').set('webunit', 'px');
model.result.export('img3').set('printheight', '90');
model.result.export('img3').set('webheight', '600');
model.result.export('img3').set('printwidth', '210');
model.result.export('img3').set('webwidth', '800');
model.result.export('img3').set('printlockratio', 'off');
model.result.export('img3').set('weblockratio', 'off');
model.result.export('img3').set('printresolution', '300');
model.result.export('img3').set('webresolution', '96');
model.result.export('img3').set('size', 'current');
model.result.export('img3').set('antialias', 'on');
model.result.export('img3').set('zoomextents', 'off');
model.result.export('img3').set('title', 'on');
model.result.export('img3').set('legend', 'on');
model.result.export('img3').set('logo', 'on');
model.result.export('img3').set('options', 'off');
model.result.export('img3').set('fontsize', '9');
model.result.export('img3').set('customcolor', [1 1 1]);
model.result.export('img3').set('background', 'color');
model.result.export('img3').set('axes', 'on');
model.result.export('img3').set('qualitylevel', '92');
model.result.export('img3').set('qualityactive', 'off');
model.result.export('img3').set('imagetype', 'png');

out = model;
