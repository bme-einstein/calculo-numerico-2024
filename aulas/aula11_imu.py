import pandas as pd
import numpy as np
import matplotlib.pyplot as plt
import os

def integrate_trapezoid(data, h):
    integrated_data = [0]
    for idx, _ in enumerate(data):
        if idx > 0:
            integrated_data.append(integrated_data[idx-1] + (data[idx]+data[idx-1]) * h/2)
    return integrated_data

def media_movel(data, window_size):
    data_filtered = []
    for idx, _ in enumerate(data):
        if idx < window_size:
            data_filtered.append(np.mean(data[:idx+1]))
        else:
            data_filtered.append(np.mean(data[idx-window_size:idx+1]))
    return data_filtered

# Step 1: Read the CSV file
main_dir = os.getcwd()
file_path = '\\aulas\HIMU-2024-11-05_10-56-57.csv'
data = pd.read_csv(main_dir+file_path, skiprows=3)

time = np.arange(0.1, data['bmi3x0_accelerometer.x'].__len__()*0.1, 0.1)

# plt.plot(time, data['bmi3x0_accelerometer.x'],'b--',  label='x')
# plt.plot(time, data['bmi3x0_accelerometer.y'],'r--', label='y')
# plt.plot(time, data['bmi3x0_accelerometer.z'],'g--', label='z')
# plt.grid()

plt.plot(time, data['orientation.x'],'b',  label='x')
plt.plot(time, data['orientation.y'],'r', label='y')
plt.plot(time, data['orientation.z'],'g', label='z')
plt.grid()

# bias_x = np.mean(data['bmi3x0_accelerometer.x'][:10])
# bias_y = np.mean(data['bmi3x0_accelerometer.y'][:10])

# data_x_no_bias = data['bmi3x0_accelerometer.x']-bias_x
# data_y_no_bias = data['bmi3x0_accelerometer.y']-bias_y

# plt.plot(time, data_x_no_bias, 'b--', label='x')
# plt.plot(time, data_y_no_bias, 'r--', label='y')

# data_xdd_no_bias_avg = media_movel(data_x_no_bias, 2)
# data_ydd_no_bias_avg = media_movel(data_y_no_bias, 2)

# plt.plot(time, data_xdd_no_bias_avg, 'b', label='x')
# plt.plot(time, data_ydd_no_bias_avg, 'r', label='y')
# plt.grid()

# h = 0.1

# # # Step 2: Integrate each column twice
# delta_xd = integrate_trapezoid(data_xdd_no_bias_avg, h)
# delta_x = integrate_trapezoid(delta_xd, h)

# delta_yd = integrate_trapezoid(data_ydd_no_bias_avg, h)
# delta_y = integrate_trapezoid(delta_yd, h)

# plt.figure()
# plt.plot(time, delta_x, label='x')
# plt.plot(time, delta_y, label='y')
# plt.grid()

# plt.xlabel('Time [s]')
# plt.ylabel('Position [m]')
# plt.legend()
plt.show()