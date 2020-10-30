function [q1,q2,q3,q4,q5,q6] = inverse2(x,y,z)

q1= sym('q1');
q2= sym('q2');
q3= sym('q3');
q4= sym('q4');
q5= sym('q5');
q6= sym('q6');

L1= 10;
L2= 10;
L3= 10;
L4= 10;

Fx= cos((pi*(q1 - 90))/180)*sin((pi*(q2 - 90))/180)*(L2 + q3) - L4*(sin((pi*(q5 + 90))/180)*(sin((pi*(q1 - 90))/180)*sin((pi*(q4 + 90))/180) - cos((pi*(q1 - 90))/180)*cos((pi*(q2 - 90))/180)*cos((pi*(q4 + 90))/180)) + cos((pi*(q1 - 90))/180)*cos((pi*(q5 + 90))/180)*sin((pi*(q2 - 90))/180)) + L3*cos((pi*(q1 - 90))/180)*sin((pi*(q2 - 90))/180)-x;
Fy=L4*(sin((pi*(q5 + 90))/180)*(cos((pi*(q1 - 90))/180)*sin((pi*(q4 + 90))/180) + cos((pi*(q2 - 90))/180)*cos((pi*(q4 + 90))/180)*sin((pi*(q1 - 90))/180)) - cos((pi*(q5 + 90))/180)*sin((pi*(q1 - 90))/180)*sin((pi*(q2 - 90))/180)) + sin((pi*(q1 - 90))/180)*sin((pi*(q2 - 90))/180)*(L2 + q3) + L3*sin((pi*(q1 - 90))/180)*sin((pi*(q2 - 90))/180)-y;
Fz= L1 - L4*(cos((pi*(q2 - 90))/180)*cos((pi*(q5 + 90))/180) + cos((pi*(q4 + 90))/180)*sin((pi*(q2 - 90))/180)*sin((pi*(q5 + 90))/180)) + cos((pi*(q2 - 90))/180)*(L2 + q3) + L3*cos((pi*(q2 - 90))/180)-z;

F=[Fx;Fy;Fz];
A1= jacobian(Fx,[q1,q2,q3,q4,q5,q6]);
A2= jacobian(Fy,[q1,q2,q3,q4,q5,q6]);
A3= jacobian(Fz,[q1,q2,q3,q4,q5,q6]);
FJ= [A1;A2;A3];
%inverseFJ= transpose(FJ)*(inv(FJ*transpose(FJ)));

qold=[50;50;50;50;50;50];

i=20;
dog=true;

while (i>0 && dog)
    q1=qold(1,1);
    q2=qold(2,1);
    q3=qold(3,1);
    q4=qold(4,1);
    q5=qold(5,1);
    q6=qold(6,1);
    
    Fsub= eval(subs(F));
    FJsub= eval(subs(FJ));
    inverseFJsub= transpose(FJsub)*(inv(FJsub*transpose(FJsub)));
        
 
    qnew=qold-inverseFJsub*Fsub;
    %disp(inverseFJsub*Fsub);
    
    
  
   
    count=0;
    disp("Old Q = " +qold);
    disp(" New Q = " +qnew);
   	for xx = 1:6
        if  ((qnew(xx,1)-qold(xx,1)<0.1) && (qnew(xx,1)-qold(xx,1)>-0.1 ))       
             count=count+1;
         end
   
    end
    
    if( count == 6)
        dog=false;
    end
    
    i=i-1;
    qold=qnew;
    disp("count = "+( 20-i));
    
end
 
   q1=qnew(1,1);
   q2=qnew(2,1);
   q3=qnew(3,1);
   q4=qnew(4,1);
   q5=qnew(5,1);
   q6=qnew(6,1);
   disp(qnew);

