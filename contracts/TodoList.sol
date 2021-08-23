pragma solidity ^0.5.0;

contract TodoList {
	uint _taskCount = 0;

	constructor() public {
        createTask("Check out dappuniversity.com");
    }

	struct Task {
	    uint id;
	    string content;
	    bool completed;
	}

	mapping(uint => Task) public tasks;

	function createTask(string memory _content) public {
	    _taskCount ++;
	    tasks[_taskCount] = Task(_taskCount, _content, false);
	}

	event TaskCompleted(
	    uint id,
	    bool completed
	);

	function toggleCompleted(uint _id) public {
	    Task memory _task = tasks[_id];
	    _task.completed = !_task.completed;
	    tasks[_id] = _task;
	    emit TaskCompleted(_id, _task.completed);
	}

	function taskCount() public returns (uint) {
	    return _taskCount;
	}
}