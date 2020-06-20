classdef FifoQueue < Queue
  % Class FifoQueue implements a First In First Out queue. 
  % 
  % The FifoQueue class inherits from the abstract class Queue. 
  %
  % The FifoQueue class implements the following methods - 
  %   1) FifoQueue - Constructor
  %   2) push      - Add data to the queue    
  %   3) pop       - Remove data from the queue
  %   4) peek      - Peek at the next element in the queue
  %
  % The FifoQueue class can be instantiated with the syntax,
  %
  % >> obj = FifoQueue(depth)
  %
  % where depth is an optional argument to the constructor specifying the
  % size of the queue. 
  
  
  methods
    
    function obj = FifoQueue(depth)
      % Constructor for class FifoQueue.
      %
      % Input(s)
      %   1) depth - Sets the queue depth. Default value is Inf.
      %
      % Example(s):
      %   >> A = FifoQueue(5)
      %   >> A = FifoQueue
      
      % Need at least 1 and up to 2 inputs
      narginchk(0,1)
      
      % Call constructor of super-class Queue
      obj = obj@Queue;
      
      % Set depth if provided
      if nargin == 0
        obj.depth_ = Inf;
      else
        obj.depth_ = depth;
      end
      
    end % constructor end
    
    function push(obj,val)
      % Add data to the queue. 
      %
      % If val is the first value to be added to the
      % queue, the type_ property of the object will be set to the data
      % type of the value. If val is not the first value to be added to the
      % queue, the datatype of val must be the same as the type_ property
      % of the queue. 
      %
      % Input(s)
      %   1) obj - FifoQueue object to which data will be added.
      %   2) val - Data to be added to the queue.
      %
      % Example(s):
      %   >> A.push(11)
      %   >> push(A,12)
      
      % Set object property type_ if this is the first value being added to
      % queue.
      if isempty(obj.type_)
        obj.type_ = class(val);
      end
      
      % Validate that the datatype of value is the same as type_ and that
      % the value is scalar.
      validateattributes(val,{obj.type_},{'size',[1 1]});
      
      % Throw an error if queue is full
      if isfull(obj)
        error('Queue is full. No more data can be added to queue until some data is removed.');
      end
      
      % Add data to queue
      obj.elements_ = [obj.elements_ val];
      
    end % push end
    
    function val = pop(obj)
      % Remove data from the queue. 
      %
      % Input(s)
      %   1) obj - FifoQueue object from which data will be extracted
      %
      % Example(s):
      %   >> val = A.pop
      %   >> val = pop(A)
      
      % Check if queue is empty
      if isempty(obj)
        error('FifoQueue:isEmpty','Queue is empty');
      end
      
      % Extract value from queue
      val = obj.elements_(1);
      
      % Delete extracted value
      obj.elements_(1) = [];
      
    end % pop end
    
    function val = peek(obj)
      % Return first element without removing it from the queue
      %
      % Input(s)
      %   1) obj - FifoQueue object in which to peek at the first value
      %
      % Example(s)
      %   >> val = peek(A)
      %   >> val = A.peek;
      
      % Check if queue is empty
      if isempty(obj)
        warning('FifoQueue:isEmptyWarning','Queue is empty');
        val = obj.elements_; % This returns an empty variable of the correct type
      else
        val = obj.elements_(1);
      end
      
    end % peek end

  end % methods end
  
end % FifoQueue end