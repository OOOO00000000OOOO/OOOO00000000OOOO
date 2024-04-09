import plotly.graph_objects as go
import numpy as np

# Define the curvature function
def kappa(x):
    return (1-((-((-1)**np.floor(x/np.pi*2)*(np.exp(-1/((x/np.pi*2)-np.floor((x/np.pi*2))))
            /(np.exp(-1/((x/np.pi*2)-np.floor((x/np.pi*2))))+np.exp(-1/(1-(x/np.pi*2)+np.floor((x/np.pi*2))))))) +
            ((-1)**np.floor((x/np.pi*2)/1)*(np.exp(-1/(1-(x/np.pi*2)+np.floor((x/np.pi*2))))/(np.exp(-1/((x/np.pi*2)-
            np.floor((x/np.pi*2))))+np.exp(-1/(1-(x/np.pi*2)+np.floor((x/np.pi*2))))))))/2 + .5))

# Generate x values
x_vals = np.linspace(0, 4*np.pi, 1000)

# Compute kappa values
kappa_vals = kappa(x_vals)

# Integrate kappa values to get theta values (angles)
theta_vals = np.cumsum(kappa_vals) * (x_vals[1]-x_vals[0])

# Compute x and y coordinates of the curve
x_coords = np.cumsum(np.cos(theta_vals)) * (x_vals[1]-x_vals[0])
y_coords = np.cumsum(np.sin(theta_vals)) * (x_vals[1]-x_vals[0])

# Create a plot using plotly
fig = go.Figure()

# Add line to the figure for the curve
fig.add_trace(go.Scatter(x=x_coords, y=y_coords, mode='lines', name='Curve'))

# Update layout
fig.update_layout(
    autosize=True,
    xaxis=dict(scaleanchor='y', scaleratio=1) # this line sets the aspect ratio
)
fig.show()