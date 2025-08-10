


import sys
import os
from pathlib import Path

# Add current directory to path
current_dir = Path(__file__).parent
sys.path.insert(0, str(current_dir))

try:
    # Import the compiled module
    import main_real
    main_real.xyz()
    
   

    
except ImportError as e:
    print(f"Error importing compiled module: {e}")
    print("Make sure the .pyd file is in the same directory as this launcher.")
    sys.exit(1)
except Exception as e:
    print(f"Error running module: {e}")
    sys.exit(1)
