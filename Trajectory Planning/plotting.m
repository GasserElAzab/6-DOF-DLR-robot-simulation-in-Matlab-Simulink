plot3(out.x,out.y,out.z,'-*');
%scatter3(out.x,out.y,out.z,[],out.t,'filled')
hold on;
xlabel('x(t)');
ylabel('y(t)');
zlabel('z(t)');
scatter3(out.x,out.y,out.z,[],out.t,'filled')
%plot(out.z,out.y);
%axis([-50 50 -50 50]);