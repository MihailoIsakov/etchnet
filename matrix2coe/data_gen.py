#! /usr/bin/env python
import numpy as np 


def gen_vector(length, min, max):
    vector = np.random.rand(length)
    vector = vector * (max - min) + min

    return vector


def twos_complement(values, bits=8):
    if bits == 8:
        assert np.all(np.array(values) >= -(2**bits))
        assert np.all(np.array(values) <= 2**bits-1)

        return np.array(values) & 0xff

    elif bits == 16:
        assert np.all(np.array(values) >= -(2**bits))
        assert np.all(np.array(values) <= 2**bits-1)

        return np.array(values) & 0xffff

    raise RuntimeError("Bit length in two's complement is not 8 or 16")


def fixed_point_vector(vector, min_bit, max_bit):
    vector = np.array(vector)
    bits = min_bit + max_bit
    vector = np.round(vector * 2**min_bit).astype(np.int)
    vector = twos_complement(vector, bits)

    fmt_str = "0" + str(bits) + "b"

    return [format(int(el), fmt_str) for el in vector]


def _vector2strings(vector, min_bit, max_bit):
    str_vectors = []
    outputs = []

    for str in fixed_point_vector(vector, min_bit, max_bit):
        str_vectors.append(str)

    for bit in range(min_bit + max_bit -1, -1, -1):
        outputs.append("".join([el[bit] for el in str_vectors]))

    return outputs


def vectors2strings(vectors, min_bit, max_bit):
    outputs = []

    for vector in vectors:
        outputs +=  _vector2strings(vector, min_bit, max_bit)

    return outputs


def vectors2coe(path, vectors, min_bit=8, max_bit=8):
    strings = vectors2strings(vectors, min_bit, max_bit)

    f = open(path, "w")
    
    f.write("; Storing a vector with each value broken down in n columns\n")
    f.write("memory_initialization_radix = 2\n")
    f.write("memory_initialization_vector = \n")

    for s in strings:
        f.write(s + "\n")


if __name__ == "__main__":
    import sys

    path  = sys.argv[1]
    width = int(sys.argv[2])
    depth = int(sys.argv[3])

    print("Generating {} vector with {} rows of {} elements".format(path, depth, width))
    vec = np.random.rand(depth, width)
    vectors2coe(path, vec)

