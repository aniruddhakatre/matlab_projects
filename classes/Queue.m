classdef (Abstract) Queue < handle
  % Abstract class Queue. 
  % 
  % It specifies abstract methods to be implemented
  % by subclasses that implement the different queue types. It also
  % provides the properties that are common to all queue types and some
  % concrete methods that are common to all queue types.
  %
  % Abstract Members: Methods
  %   All abstract members must be implemented by subclasses.
  %   1) push     - Add data to queue
  %   2) pop      - Remove next data element from the queue
  %   3) peek     - Peek at the next data element in the queue
  %
  % Concrete Members: Methods
  %   All subclasses can use the concrete members provided by the Queue
  %   class.
  %   1) get_num_elements   - Get number of data elements in the Queue
  %   2) isempty            - Check if Queue is empty
  %   3) isfull             - Check if Queue is full
  %   4) poll               - Print out state information about the Queue.
  %   5) get_element_type   - Get the datatype of data in Queue.
  %
  % The constructor for the abstract class must be called within the
  % subclass' constructor.

  
  properties (GetAccess = protected, SetAccess = protected)
    type_   char                    % datatype of the data in queue
    depth_  (1,1) {mustBeNumeric}   % depth of the queue
  end
  
  properties (GetAccess = protected, SetAccess = protected, Hidden = true)
    elements_           % data in the queue
  end
  
  methods (Abstract)
    
    push(obj,val)       % add data to queue
    val = pop(obj)      % remove data from queue
    val = peek(obj)     % peek at next element in queue
    
  end
  
  methods
    
    function num = get_num_elements(obj)
      % Get the number of data elements in the queue
      % 
      % Example(s):
      %   >> num = get_num_elements(obj)
      %   >> num = obj.get_num_elements
      
      % If no output arguments specified, it simply prints out the
      % information. Otherwise, it returns the number of elements in the
      % Queue.
      
      if nargout == 0
        obj.poll
      elseif nargout > 1
        error('Only one output argument is supported for get_num_elements');
      else
        num = length(obj.elements_);
      end
      
    end % end get_num_elements
    
    function res = isempty(obj)
      % Check if queue is empty. Returns true if the queue is empty and
      % false if it is not empty.
      %
      % Example(s)
      %   >> res = isempty(obj)
      %   >> res = obj.isempty
      
      res = isempty(obj.elements_);
    end % end isempty
    
    function res = isfull(obj)
      % Check if queue is full. Returns true if the queue is full and false
      % if the queue is empty.
      %
      % Example(s)
      %   >> res = isfull(obj)
      %   >> res = obj.isfull
      
      res = numel(obj.elements_) == obj.depth_;
    end % end isfull
    
    function type = get_element_type(obj)
      % Get the datatype of the data in the queue.
      %
      % Example(s)
      %   >> type = get_element_type(obj)
      %   >> type = obj.get_element_type
      type = obj.type_;
    end % end get_element_type
  end % end methods
  
  methods (Access = protected)
    
    function poll(obj)
      % Print the number of elements in the queue and the datatype of those
      % elements. This method is only available to class and subclass
      % members.
      
      if isempty(obj.elements_)
        fprintf(['No data in queue. ',...
          'Use the push() method to add data to the queue.\n']);
      else
        fprintf('%d number of elements of type %s are queued.\n',...
          numel(obj.elements_),...
          obj.type_);
      end
      
    end % end poll
    
  end % end protected methods
  
end % end Queue