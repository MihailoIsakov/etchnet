import numpy as np


def generate_matrix(size, sparsity):
    matrix = np.random.rand(*size)
    mask   = np.random.binomial(1, sparsity, size)

    return matrix, mask


def encode_as_pow_n_sum(value, n, min2=-7, max2=8):
    signs  = []
    coding = []

    for run in range(n):
        current = np.sum([s * 2**x for s, x in zip(signs, coding)])

        next_sign = np.sign(value - current)
        signs.append(next_sign)

        error = np.abs(value - current)

        left_power = np.floor(np.log2(error))
        if (error - 2**left_power < 2 ** (left_power+1) - error):
            power = left_power
        else:
            power = left_power + 1

        coding.append(power)

    return signs, coding


def get_coding_error(value, n):
    signs, coding = encode_as_pow_n_sum(value, n)
    result = np.sum([s*2**e for s, e in zip(signs, coding)])

    return result, np.abs(value - result)

