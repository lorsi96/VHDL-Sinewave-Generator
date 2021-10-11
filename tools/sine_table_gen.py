import numpy as np

import numpy as np
import matplotlib.pyplot as plt

# ******************************************************************************************************************** #
#                                                         Specs                                                        #
# ******************************************************************************************************************** #
N_SAMPLES = 1024
SINE_N_LEVELS = 2**8

# ******************************************************************************************************************** #
#                                                     LUT Generator                                                    #
# ******************************************************************************************************************** #
LUT_TEMPLATE = '''begin
    case address is
{lut_entries}
    end case;
end process;'''

def lut_entry_gen(address, value, add_bits=8, val_bits=8):
  return ('        when "{0:0' + str(add_bits) +'b}" => result <= "{1:0' + str(val_bits) +'b}";').format(address, value) + f' -- {hex(value)}'

def tab_gen(arr):
  add_bits = int(np.ceil(np.log2(len(arr))))
  val_bits = int(np.ceil(np.log2(max(arr))))
  return '\n'.join([lut_entry_gen(i, v, add_bits, val_bits) for i, v in enumerate(arr)])

x = np.linspace(0, 2*np.pi, N_SAMPLES)
y = (0.5 * np.sin(x) + 0.5)  * SINE_N_LEVELS
plt.plot(y)
y_quantized = np.digitize(y, range(0, SINE_N_LEVELS), True) - 1

# ******************************************************************************************************************** #
#                                                        Report                                                        #
# ******************************************************************************************************************** #

print(LUT_TEMPLATE.format(lut_entries = tab_gen(y_quantized)))
