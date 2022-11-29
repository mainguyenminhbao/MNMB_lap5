create proc lab5_cau1_a @name nvarchar(20)
as
	begin
		print 'Xin chào: ' + @name
	end
exec lab5_cau1_a N'Mai Nguyễn Minh Bảo '
go



create proc lab5_cau1_b @so1 int, @so2 int
as
	begin
		declare @tong int = 0;
		set @tong = @so1 + @so2 
		print 'tong: ' + cast(@tong as varchar(10))
	end

exec lab5_cau1_b 7,8
go



create proc lab5_cau1_c @l int
as
	begin
		declare @tong int = 0, @i int = 0;
		while @i < @l
			begin
				set @tong = @tong + @i
				set @i = @i + 2
			end
		print 'tổng: ' + cast(@tong as varchar(10))
	end
exec lab5_cau1_c 15
go



create proc lab5_cau1_d @a int, @b int
as
	begin
		while (@a != @b)
			begin
				if(@a > @b)
					set @a = @a -@b
				else
					set @b = @b - @a
			end
			return @a
	end
declare @l int
exec @l = lab5_cau1_d 5,7 
print @l
go



create proc lab5_cau2_a @MaNV varchar(20)
as
	begin
		select * from NHANVIEN where MANV = @MaNV
	end
exec lab5_cau2_a '003'
go



select count(MANV), MADA, TENPHG from NHANVIEN
inner join PHONGBAN on NHANVIEN.PHG = PHONGBAN.MAPHG
inner join DEAN on DEAN.PHONG = PHONGBAN.MAPHG
where MADA = 2
group by TENPHG,MADA

alter proc lab5_cau2_b @manv int
as
begin
		select count(MANV) as 'so luong', MADA, TENPHG from NHANVIEN
		inner join PHONGBAN on NHANVIEN.PHG = PHONGBAN.MAPHG
		inner join DEAN on DEAN.PHONG = PHONGBAN.MAPHG
		where MADA = @manv
		group by TENPHG,MADA
end
exec lab5_cau2_b 10 
go

