import wave
import numpy as np

def wav_to_coe(wav_file, coe_file, memory_depth):
    with wave.open(wav_file, 'r') as wav:
        n_channels, sampwidth, framerate, n_frames, _, _ = wav.getparams()
        print(f"Channels: {n_channels}, Sample Width: {sampwidth}, Frame Rate: {framerate}, Frames: {n_frames}, Bit Depth: {sampwidth * 8} bits")
        frames = wav.readframes(n_frames)
        audio_data = np.frombuffer(frames, dtype=np.int16)

        # If it's stereo, take mono
        if n_channels == 2:
            audio_data = audio_data[::2]

        audio_data = audio_data[:memory_depth]

        audio_data = (audio_data + 32768) & 0xFFFF

        with open(coe_file, 'w') as coe:
            coe.write("memory_initialization_radix=16;\n")
            coe.write("memory_initialization_vector=\n")
            for i, sample in enumerate(audio_data):
                coe.write(f"{sample:04X}")
                if i < len(audio_data) - 1:
                    coe.write(",\n")
                else:
                    coe.write(";\n")
    print(f"COE file generated: {coe_file}")

wav_to_coe("end.wav", "end.coe", memory_depth=10240000)