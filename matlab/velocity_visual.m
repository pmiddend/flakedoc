pimiddy_velocity_x = dlmread('/tmp/velocity_x.mat');
pimiddy_velocity_y = dlmread('/tmp/velocity_y.mat');

% Assume square
assert(size(pimiddy_velocity_x,1) == size(pimiddy_velocity_x,2))
assert(all(size(pimiddy_velocity_x) == size(pimiddy_velocity_y)))

s = size(velocity_x,1);

%%

pimiddy_divergence = divergence(pimiddy_velocity_x,pimiddy_velocity_y);
[pimiddy_curl,pimiddy_angular_velocity] = curl(pimiddy_velocity_x,pimiddy_velocity_y);
[pimiddy_curl_gradient_x,pimiddy_curl_gradient_y] = gradient(pimiddy_curl);
pimiddy_curl_gradient_norm = sqrt(pimiddy_curl_gradient_x.^2 + pimiddy_curl_gradient_y.^2);
pimiddy_curl_gradient_normalized_x = pimiddy_curl_gradient_x./pimiddy_curl_gradient_norm;
pimiddy_curl_gradient_normalized_y = pimiddy_curl_gradient_y./pimiddy_curl_gradient_norm;
pimiddy_confinement_cross_x = pimiddy_curl_gradient_normalized_y;
pimiddy_confinement_cross_y = pimiddy_curl_gradient_normalized_x.*(-1);

pimiddy_axis = [135 170 124 140];
pimiddy_plot_count = 3;

pimiddy_plot_counter = 1;

subplot(1,pimiddy_plot_count,pimiddy_plot_counter)
quiver(pimiddy_velocity_x,pimiddy_velocity_y,3);
axis(pimiddy_axis)
pimiddy_plot_counter = pimiddy_plot_counter+1;

%subplot(1,pimiddy_plot_count,pimiddy_plot_counter)
%quiver(pimiddy_curl_gradient_x,pimiddy_curl_gradient_y,4);
%axis(pimiddy_axis)
%pimiddy_plot_counter = pimiddy_plot_counter+1;
subplot(1,pimiddy_plot_count,pimiddy_plot_counter)
pimiddy_part_curl = pimiddy_curl(pimiddy_axis(1):pimiddy_axis(2),pimiddy_axis(3):pimiddy_axis(4));
pimiddy_part_curl = (pimiddy_part_curl - min(pimiddy_part_curl(:)))./(max(pimiddy_part_curl(:)) - min(pimiddy_part_curl(:)));

imagesc(pimiddy_part_curl.*pimiddy_part_curl)
colormap(jet)
%axis(pimiddy_axis)
pimiddy_plot_counter = pimiddy_plot_counter+1;

subplot(1,pimiddy_plot_count,pimiddy_plot_counter)
quiver(pimiddy_confinement_cross_x,pimiddy_confinement_cross_y,0.2);
axis(pimiddy_axis)
pimiddy_plot_counter = pimiddy_plot_counter+1;

hist(pimiddy_part_curl(:))

%plot2svg;

%%

velocity_z = zeros(size(velocity_x));
velocity_x = repmat(velocity_x,[1 1 s]);
velocity_y = repmat(velocity_y,[1 1 s]);
velocity_z = repmat(velocity_z,[1 1 s]);

%[sx,sy] = meshgrid(1,1:255);
%streamline(velocity_x,velocity_y,sx,sy);

[X,Y,Z] = meshgrid(1:s,1:s,1:s);
%[sx,sy,sz] = meshgrid(1,30:15:200,30:100:255);
[sx,sy,sz] = meshgrid(1,30:15:200,130);

% Clear figure
clf

plot3(sx(:),sy(:),sz(:),'*r');
axis(volumebounds(X,Y,Z,velocity_x,velocity_y,velocity_z))
grid;
box;
daspect([1 1 1])

%streamline(X,Y,Z,velocity_x,velocity_y,velocity_z,sx,sy,sz)

%streamslice(X,Y,Z,velocity_x,velocity_y,velocity_z,sx,sy,sz)
%axis tight