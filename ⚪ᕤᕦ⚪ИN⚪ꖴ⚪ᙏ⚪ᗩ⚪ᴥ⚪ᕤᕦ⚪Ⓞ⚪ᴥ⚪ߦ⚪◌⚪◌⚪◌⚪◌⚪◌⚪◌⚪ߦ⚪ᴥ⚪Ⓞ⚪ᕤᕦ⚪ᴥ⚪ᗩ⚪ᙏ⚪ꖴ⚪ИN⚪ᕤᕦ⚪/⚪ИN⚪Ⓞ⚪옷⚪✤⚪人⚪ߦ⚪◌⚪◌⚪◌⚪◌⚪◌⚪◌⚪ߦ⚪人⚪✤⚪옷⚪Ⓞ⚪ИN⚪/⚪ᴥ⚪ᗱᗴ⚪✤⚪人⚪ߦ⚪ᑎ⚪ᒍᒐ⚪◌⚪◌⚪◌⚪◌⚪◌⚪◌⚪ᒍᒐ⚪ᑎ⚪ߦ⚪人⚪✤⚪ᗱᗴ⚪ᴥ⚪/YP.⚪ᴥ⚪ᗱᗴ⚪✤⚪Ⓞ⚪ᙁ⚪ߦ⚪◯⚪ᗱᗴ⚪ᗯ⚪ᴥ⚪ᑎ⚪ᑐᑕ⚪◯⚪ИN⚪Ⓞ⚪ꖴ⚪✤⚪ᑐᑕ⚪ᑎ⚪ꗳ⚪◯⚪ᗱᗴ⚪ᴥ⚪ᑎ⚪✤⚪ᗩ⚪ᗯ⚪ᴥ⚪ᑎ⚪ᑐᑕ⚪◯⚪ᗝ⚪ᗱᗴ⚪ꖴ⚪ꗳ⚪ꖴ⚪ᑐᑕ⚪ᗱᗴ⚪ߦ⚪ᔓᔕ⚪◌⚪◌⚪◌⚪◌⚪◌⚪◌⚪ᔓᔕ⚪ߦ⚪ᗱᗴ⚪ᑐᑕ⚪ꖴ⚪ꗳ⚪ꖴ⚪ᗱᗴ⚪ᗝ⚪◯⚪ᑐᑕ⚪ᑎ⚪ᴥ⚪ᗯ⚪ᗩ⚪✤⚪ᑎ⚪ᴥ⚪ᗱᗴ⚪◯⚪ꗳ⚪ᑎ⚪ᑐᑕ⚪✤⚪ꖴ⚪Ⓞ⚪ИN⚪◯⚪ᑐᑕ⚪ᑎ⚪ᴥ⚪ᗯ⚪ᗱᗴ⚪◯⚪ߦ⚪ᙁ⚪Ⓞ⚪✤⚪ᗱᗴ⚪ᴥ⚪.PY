import numpy as np
from ipywidgets import interact
import plotly.graph_objects as go
from math import *

def kappa(formula, x):
    return eval(formula, {'acos': acos, 'exp': exp, 'cos': cos, 'sin': sin, 'pi': pi, 'x': x})

def plot(formula='(1 + cos(((4)/2)*x))/2', RANGE_FROM=0, RANGE_TO=4*pi, N=10):
    num_points = 1+2**N

    # Generate x values with the specified number of points
    x_vals = np.linspace(RANGE_FROM, RANGE_TO, num_points)

    # Compute kappa values
    kappa_vals = np.array([kappa(formula, x_val) for x_val in x_vals])

    theta_vals = np.cumsum(kappa_vals) * (x_vals[1]-x_vals[0]) if num_points > 1 else np.array([0])
    x_coords_ = np.cumsum(np.cos(theta_vals)) * (x_vals[1] - x_vals[0]) if num_points > 1 else np.array([0])
    y_coords_ = np.cumsum(np.sin(theta_vals)) * (x_vals[1] - x_vals[0]) if num_points > 1 else np.array([0])

    # Check if the first point is zero, if not, add it manually
    if x_coords_[0] != 0 or y_coords_[0] != 0:
        x_coords = np.insert(x_coords_, 0, 0)
        y_coords = np.insert(y_coords_, 0, 0)
    else:
        x_coords = x_coords_
        y_coords = y_coords_

    fig = go.Figure()

    fig.add_trace(go.Scatter(x=x_coords, y=y_coords, mode='lines', name='Curve'))

    fig.update_layout(autosize=True, xaxis=dict(scaleanchor='y', scaleratio=1))
    fig.show()

# Create the interactive plot
interact(plot, formula='(1 + cos(((4)/2)*x))/2', RANGE_FROM=(0, 4*pi, pi/4), RANGE_TO=(0, 4*pi, pi/4), N=(1,16));