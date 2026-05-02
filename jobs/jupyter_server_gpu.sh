#!/bin/bash
#SBATCH --job-name=jupyter
#SBATCH --mem=64G
#SBATCH --time=5-00:00:00
#SBATCH --partition=gpu
#SBATCH --gres=gpu:1

# Puerto aleatorio para evitar colisiones
PORT=$(shuf -i 8000-9999 -n 1)
NODE=$(hostname)

echo "Para usar el jupyter server fuera de hypatia"
echo "Nodo: $NODE"
echo "Puerto: $PORT"
echo "Comando de túnel: ssh -N -L ${PORT}:${NODE}:${PORT} <tu_usuario>@hypatia.uniandes.edu.co"

uv run jupyter lab --no-browser --port=$PORT --ip=0.0.0.0