﻿create FUNCTION [ssma_oracle].[pad_nvarchar](
    @Switch tinyint = 1, 
    @left as nvarchar(max), 
    @n as int, 
    @pad as nvarchar(max) = ' ')
returns nvarchar(max)
begin

    declare @retval as nvarchar(max), @TempPad nvarchar(max), @Lenleft integer, @LenPad integer

    set @Lenleft = Len(replace(@left, ' ', '.'))
    set @LenPad = Len(replace(@pad, ' ', '.'))

    if @Lenleft = 0 or @LenPad = 0 or isnull(@n, 0) = 0 or @n <= 0
      begin
        set @retval = null
        return @retval
      end;

    if @Lenleft >= @n
      begin
        set @retval = left(@left, @n)
        return @retval
      end

    set @TempPad = replicate(@pad, ceiling(cast(@n - @Lenleft as float) / @LenPad))

    if @Switch = 2
      set @retval = @left + left(@TempPad, @n - @Lenleft)
    else
      set @retval = left(@TempPad, @n - @Lenleft) + @left

    return @retval
end