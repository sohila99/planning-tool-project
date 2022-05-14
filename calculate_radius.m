function [cell_radius]=calculate_radius(no_of_cells)

city_area=100;

cell_area=city_area/no_of_cells;
cell_radius=sqrt(cell_area/(1.5*sqrt(3)));

end