function [numdata, strdata] = readDat()

fileName = "ecs171.dataset.small.txt";
fid = fopen(fileName,'rt');
delim = " ";

line = fgets(fid);

if (line == -1)
	% abort program
else
if (line ~= -1)	
	while (TRUE)
		line = fgets(fid)
		if (line == -1)
			break;
		endif

		elems = strsplit(line, delim);
		nums = str2double(elems);
		nans = isnan(nums);

		idxnans = find(nans);

		if any(ismember(idxnans, i))
			varargout{i}{end+1} = elems{i};
        else
        	varargout{i}{end+1} = nums(i);
        endif
	endwhile
endif



count = 0;
while(line ~= -1)
		line = fgets(fid)
		if (line == -1)
			break;
		endif
		count = count + 1;
endwhile
