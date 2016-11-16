function [data, categoriacl] = readData()

	fileName = "ecs171.dataset.small.txt";
	fid = fopen(fileName,'rt');

	line = fgetl(fid);
	titles = strsplit(line);

	data = []; 
	categorical = [];

	count = 0

	if (line == -1)
		% abort program
	else
		while (line ~= -1)
			line = fgetl(fid);
			if (line == -1)
				break;
			endif

			elems = strsplit(line);
			nums = str2double(elems);
			if( any(isnan(nums(4502))))
				nums(4502) = -1;
			endif

			numsModified = nums(!isnan(nums));
			strdat = {elems{isnan(nums)}} ; 

			data = [data;numsModified];
			if(sum(size(categorical)) == 0)
				categorical = strdat;
			else
				categorical = [categorical; strdat];
			endif

			count = count + 1
		endwhile
	endif
	fclose(fid);

endfunction



