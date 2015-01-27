%
% This program is free software; you can redistribute it and/or
% modify it under the terms of the GNU General Public License
% version 2 as published by the Free Software Foundation.
%
% This program is distributed in the hope that it will be useful,
% but WITHOUT ANY WARRANTY; without even the implied warranty of
% MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE. See the
% GNU General Public License for more details.
%
% You should have received a copy of the GNU General Public License
% along with this program; if not, write to the Free Software
% Foundation, Inc., 51 Franklin Street, Fifth Floor, Boston, MA 02110-1301, USA.

function [] = plotPtCloud(X,varargin)

%PLOTSHAPE  Visual representation of 3D data.
%
%   PLOTSHAPE(X) displays the configuration X if X is m-by-k, or the 
%   superimposed n configurations if X is m-by-k-by-n.
%
%   PLOTSHAPE(X,'ColorType') draws the point cloud with a specific colour.
%
%	v0.1 original version (Simon Preston)
%   v0.2 modifications for handling generic point Clouds (Pratyush Sahay)


[m,k,n] = size(X);
noOfPoints = k*n;

holdStatus = ishold;

if m==3,  z = reshape(squeeze(X(3,:,:))',[1 noOfPoints]);  end;

% point Cloud colour
ptCloudColour = {'b', 'r', 'm', 'k'};
numCol = numel(ptCloudColour);
pntSty = {'.', 'o', 'x', 'p', 's', 'd', 'h'};
numSty = numel(pntSty);

% If no plot style is specified, default to plotting unconnected blue dots.
if isempty(varargin)
   varargin{1} = '.';
end

%visualize the data (2D or 3D) 
if m == 2
      x = reshape(squeeze(X(1,:,:))',[1 noOfPoints]);
      y = reshape(squeeze(X(2,:,:))',[1 noOfPoints]);      
      plot(x,y,varargin{:});
elseif m == 3
      x = reshape(squeeze(X(1,:,:))',[1 noOfPoints]);
      y = reshape(squeeze(X(2,:,:))',[1 noOfPoints]);
      z = reshape(squeeze(X(3,:,:))',[1 noOfPoints]);
      plot3(x,y,z,varargin{:});
else,  error('Shape data must be two- or three-dimensional');
end

if ~holdStatus,  hold off;  end;

axis equal;
axis vis3d;
