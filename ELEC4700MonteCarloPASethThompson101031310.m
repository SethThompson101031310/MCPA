% Name: Seth Thompson
% Student Number: 101031310
close all
clear
clc

% January 24th PA | MonteCarlo PA Assignment

% a) Initializing the electrons position and velocity
ElectronX = 0;
ElectronV = 0;

% b) Moving the electron in time with a force present.
% F = ma, mass of an electron is 9.109e-31 kg, if we assume F is around 
% 1e-24 N then the acceleration can be calculated.
massE = 9.109e-31; % kg
force = 1e-31; % Newton
accelerationE = force/massE;

% Creating a timestep variable in order to get the velocity and from there
% the particles displacement.
timestep = 1e-12;
timestepINC = timestep;

% Setting up a constant to check for scattering
scatterProb = 0.05;

% Setting up a constant to take the sum of all velocities and a variable to
% hold the average
VSum = 0;
DVelocity = 0;
for n = 1:1000
       
    % Plotting the electron over time
    if (n == 1)
        % Code to make the actual plot and plot the atart of each variable
        figure(1)
        % Displacement Vs time
        subplot(3,1,1)
        plot(timestepINC,ElectronX,'b.')
        title('1D Electron position | Seth Thompson 101031310')
        xlabel('Displacement on X-axis')
        ylabel('Displacement on Y-axis')
        hold on
        
        % Velocity Vs time
        subplot(3,1,2)
        plot(timestepINC,ElectronV,'r.')
        title({['1D Electron Velocity | Seth Thompson 101031310'],[ 'Drift Velocity = ' num2str(DVelocity)]})
        xlabel('Velocity on X-axis')
        ylabel('Velocity on Y-axis')
        hold on
        
        % Displacement Vs Velocity
        subplot(3,1,3)
        plot(ElectronX,ElectronV,'g.')
        title('1D Electron Displacement Vs Velocity | Seth Thompson 101031310')
        xlabel('Electron Displacement')
        ylabel('Electron Velocity')
        hold on
        
        % Update the timestep, velocity and positon for each new timestep
        timestepINC = timestepINC + timestep;
        if (rand(1,1) > scatterProb)
            ElectronV = ElectronV + accelerationE * timestepINC;
        else
            ElectronV = 0;
        end
        VSum = VSum + ElectronV;
        DVelocity = VSum/n;
        ElectronX = ElectronX + ElectronV * timestepINC;
    elseif (n > 1 && n < 1000)
        % Displacement Vs time
        subplot(3,1,1)
        plot(timestepINC,ElectronX,'b.')
        hold on
        
        % Velocity Vs time
        subplot(3,1,2)
        plot(timestepINC,ElectronV,'r.')
        title({['1D Electron Velocity | Seth Thompson 101031310'],[ 'Drift Velocity = ' num2str(DVelocity)]})
        hold on
        
        % Displacement Vs Velocity
        subplot(3,1,3)
        plot(ElectronX,ElectronV,'g.')
        hold on
        
        % Update the timestep, velocity and positon for each new timestep
        timestepINC = timestepINC + timestep;
        if (rand(1,1) > scatterProb)
            ElectronV = ElectronV + accelerationE * timestepINC;
        else
            ElectronV = 0;
        end
        VSum = VSum + ElectronV;
        DVelocity = VSum/n;
        ElectronX = ElectronX + ElectronV * timestepINC;
    elseif (n == 1000)
        % Displacement Vs time
        subplot(3,1,1)
        plot(timestepINC,ElectronX,'b.')
        hold off
        
        % Velocity Vs time
        subplot(3,1,2)
        plot(timestepINC,ElectronV,'r.')
        title({['1D Electron Velocity | Seth Thompson 101031310'],[ 'Drift Velocity = ' num2str(DVelocity)]})
        hold off
        
        % Displacement Vs Velocity
        subplot(3,1,3)
        plot(ElectronX,ElectronV,'g.')
        hold off
        
        % Update the timestep, velocity and positon for each new timestep
        timestepINC = timestepINC + timestep;
        if (rand(1,1) > scatterProb)
            ElectronV = ElectronV + accelerationE * timestepINC;
        else
            ElectronV = 0;
        end
        VSum = VSum + ElectronV;
        DVelocity = VSum/n;
        ElectronX = ElectronX + ElectronV * timestepINC;
    end
    
    % Pause the script for a millisecond so whoever is runnign it can vew
    % the plot being made over time
    pause(0.0001)
end