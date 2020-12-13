clc;clear all;close all;
%% Algorithms 
%% Choose your Rendezvous algorithm
% Newly Proposed Weighted Bearing Controllers
algorithm1 = 'weighted_bearing_consensus_using_RSS_and_DOA'; % It uses the DOA of RSS and the RSS form wireless nework measurements as control inputs
%algorithm = 'weighted_bearing_consensus_using_Range_and_Bearings'; % It uses both range and bearing measurements from any sensors as control inputs

% Coordinates based consensus (Rendezvous) algorithms - using relative position measurements
%algorithm = 'coordinates_based_rendezvous' ; % (Baseline) It relies on the full coordinates (relative positions) of neighbor robots
algorithm2 = 'coordinates_based_connectivity_preserving_rendezvous' ; % It is similar to the above but uses weights (artificial potential fields)
%algorithm = 'coordinates_based_rendezvous_circumcenter' ; % It relies on the circumcenter of all coordinates (relative positions) of neighbor robots


% State of the Art (SOTA) Bearing-only consensus(Rendezvous) algorithms
%algorithm = 'bearing_only_rendezvous_using_all_bearings'; % It uses bearing measurements of all neighbor robots from each robot
%algorithm = 'bearing_only_rendezvous_using_min_and_max_bearings'; % It uses only the min and max bearings of neighbors from each robot
algorithm3 = 'bearing_only_rendezvous_using_enclosing_circles'; % It uses bearing measurmeents and enclosing circles algorithm

% Other possible consensus controllers - both coordinates and bearings based controllers
algorithm4 = 'bearing_only_rendezvous_using_average_bearing'; % It uses mean of neighbor bearings from each robot
%algorithm = 'coordinates_based_rendezvous_with_mean_velocity'; % It uses mean of all neighbor directions
%algorithm = 'coordinates_based_rendezvous_with_max_velocity'; % It uses the coordinate of farthest neighbor
%algorithm = 'coordinates_based_rendezvous_with_min_velocity'; % It uses th
%% Implementation 
N=15;
t = linspace(1,1000,1000);
[L,RSS_DOA_energy] = rendezvous_experiments(N,algorithm1,1000);
pause(10);
coord__based_energy = rendezvous_experiments(N,algorithm2,1000);
pause(10);
bearing_only_energy = rendezvous_experiments(N,algorithm3,1000);
figure();
grid on;
hold on;
plot(t,RSS_DOA_energy);
plot(t,coord__based_energy);
plot(t,bearing_only_energy);
legend('RSS-DOA','connectivity preserving','bearing only');
