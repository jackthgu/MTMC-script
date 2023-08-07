import json
import glob
import os

def combine_json_files(directory):
    combined_data = {}
    
    # Using glob to get all the JSON files in the directory
    json_files = glob.glob(os.path.join(directory, '*.json'))
    
    for file_path in json_files:
        # Extract the step number from the filename
        step_num = int(os.path.basename(file_path).split('.')[0].split('step')[-1])
        
        with open(file_path, 'r') as f:
            data = json.load(f)
        combined_data[f"frame{step_num}"] = data

    # Write combined data to a new JSON file
    combined_file_path = os.path.join(directory, "combined_data.json")
    with open(combined_file_path, 'w') as f:
        json.dump(combined_data, f)

    return combined_file_path

if __name__ == "__main__":
    directory = input("Enter the directory path: ")
    combine_json_files(directory)