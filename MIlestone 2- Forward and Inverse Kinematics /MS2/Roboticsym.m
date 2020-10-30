%function [HomMatrix] = Roboticsym()
q1= sym('q1');
q2= sym('q2');
q3= sym('q3');
q4= sym('q4');
q5= sym('q5');
q6= sym('q6');
L1= sym('L1');
L2= sym('L2');
L3= sym('L3');
L4= sym('L4');

A0T1= [cosd(q1-90),0,-sind(q1-90),0;
    sind(q1-90),0,cosd(q1-90),0;
    0,-1,0,L1; 
    0,0,0,1];
A1T2= [cosd(q2-90),0,sind(q2-90),0;
    sind(q2-90),0,-cosd(q2-90),0;
    0,1,0,0;
    0,0,0,1];
A2T3= [1,0,0,0;
    0,1,0,0;
    0,0,1,L2+q3;
    0,0,0,1];
A3T4= [cosd(q4+90), 0,sind(q4+90),0;
    sind(q4+90),0,-cosd(q4+90),0;
    0,1,0,L3;
    0,0,0,1];
A4T5= [cosd(q5+90),0,sind(q5+90),0;
    sind(q5+90),0,-cosd(q5+90),0;
    0,1,0,0;
    0,0,0,1];
A5T6= [cosd(q6),-sind(q6),0,0;
    sind(q6),cosd(q6),0,0;
    0,0,1,L4;
    0,0,0,1;];

HomMatrix= A0T1*A1T2*A2T3*A3T4*A4T5*A5T6;
A0T2= A0T1*A1T2;
A0T3= A0T1*A1T2*A2T3;
A0T4= A0T1*A1T2*A2T3*A3T4;
A0T5= A0T1*A1T2*A2T3*A3T4*A4T5;



