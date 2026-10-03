---
markmap:
  colorFreezeLevel: 2
  initialExpandLevel: 3
  maxWidth: 300
  duration: 300
---

# AI Fundamentals

## Classical AI Algorithms

### Search & Planning
- DFS, BFS
- A*, heuristic evaluation
- State representation & transition functions

### Knowledge Representation & Reasoning
- Rule-based systems: rules, facts, inference engine
- First-order logic: predicates, inference functions
- Semantic networks / ontologies: nodes, edges, reasoning

### Probabilistic Models
- Bayesian networks: CPTs, inference
- Hidden Markov Models: forward-backward, Viterbi
- Markov Decision Processes: state, action, reward

## Machine Learning Core Components

### Data Processing Functions
- Feature extraction & normalization
- One-hot encoding, embeddings
- Data augmentation functions
- Batching, shuffling

### Model Components
- Layers: dense, convolutional, recurrent
- Weights, biases, parameters
- Forward pass: per-layer computation

### Loss Functions
- MSE, cross-entropy, hinge, KL divergence
- Custom loss implementations

### Training Functions
- Forward pass
- Backpropagation: gradient per layer
- Weight updates: SGD, Adam, RMSProp

### Regularization & Stabilization
- Dropout
- Batch / Layer normalization
- Weight decay

### Evaluation Functions
- Accuracy, precision, recall, F1
- Confusion matrix
- ROC-AUC

## Deep Learning Layer Granularity

### Neuron & Layer Functions
- Activation: ReLU, sigmoid, tanh, softmax
- Dense computation: input × weights + bias

### Convolutional Layers
- Filter/kernel application
- Stride, padding
- Pooling: max pooling, average pooling
- Feature map computation

### Recurrent Layers
- Hidden state update
- LSTM gates: forget, input, output
- GRU computations

### Transformer Layer Functions
- Attention: query, key, value computation
- Multi-head attention: split, concat, project
- Residual connections, LayerNorm
- Feedforward sublayer computation
- Masking: causal masks

## Modern AI / Generative Models

### Tokenization & Embeddings
- Vocabulary: BPE, WordPiece
- Token embeddings, positional embeddings

### Training Pipelines
- Mini-batch computation
- Gradient accumulation
- Learning rate schedules
- Gradient clipping

### Generative Models
- GAN: generator/discriminator update
- Diffusion: forward & reverse processes

### Reinforcement Learning
- Q-table update
- Policy gradient
- Advantage estimation
- Reward shaping

## AI System Functions

### Hardware & Parallelism
- GPU / TPU tensor operations
- Mixed precision computation
- Memory optimization for tensors

### Data Pipelines
- Preprocessing, augmentation, batching

### Debugging & Visualization
- TensorBoard metrics
- Gradient flow visualization
- Activation heatmaps

## Language Models & LLM Internals

### Tokenization & Input Functions
- Subword tokenization, vocabulary lookup
- Positional encoding application

### Embedding Functions
- Token embedding computation
- Contextualization per transformer layer

### Transformer Operations (LLM-specific)
- Attention: Q, K, V computation
- Multi-head attention: concat, project
- Residual connections
- LayerNorm
- Feedforward computation
- Masking: causal attention

### Training Pipeline
- Forward pass: logits computation
- Loss: cross-entropy for next-token
- Backprop: gradient through attention & residual
- Optimizers: AdamW, weight decay, learning rate schedules
- Distributed training: gradient synchronization

### Inference & Decoding Functions
- Sampling: greedy, beam search, top-k, top-p
- Temperature scaling
- Attention cache & memory management

### Fine-tuning & Adaptation
- Instruction tuning
- RLHF: reward model, policy update
- LoRA / PEFT: parameter-efficient tuning

### Evaluation & Safety
- Perplexity computation
- Benchmarking
- Bias, toxicity, alignment
