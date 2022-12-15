import { Box } from "@mui/material";
import Header from "../../components/Header";


const MCPs = () => {
  return (
    <Box className="pl-4">
        <Header title="Tạo Nhiệm Vụ" subtitle="" />
        <Box className="grid grid-rows-4">
            <Box className="grid grid-cols-2">
                <Box>
                    <label for="exampleInputDescription" class="form-label inline-block mb-2 text-gray-700">Mô Tả</label>
                    <input type="text" class="form-control
                        block
                        w-full
                        px-3
                        py-1.5
                        text-base
                        font-normal
                        text-gray-700
                        bg-white bg-clip-padding
                        border border-solid border-gray-300
                        rounded
                        transition
                        ease-in-out
                        m-0
                        focus:text-gray-700 focus:bg-white focus:border-blue-600 focus:outline-none" id="exampleInputDescription"
                        placeholder="Mô Tả"/>
                </Box>
                <Box className="pl-10 pb-10">
                    <span className="inline-block mb-2 text-gray-700">Loại Xe</span>
                    <select
                        name="vehicle"
                        id="vehicle"
                        // onChange={(e) => setNumOfPerson(e.target.value)}
                        className="
                        block
                        px-3
                        py-1.5
                        text-base
                        font-normal
                        text-gray-700
                        bg-white bg-clip-padding
                        border border-solid border-gray-300
                        rounded
                        transition
                        ease-in-out
                        m-0
                        focus:text-gray-700 focus:bg-white focus:border-blue-600 focus:outline-none"
                        
                        >
                        <option value="truck">Truck</option>
                        <option value="troller">Troller</option>
                    </select>
                </Box>
            </Box>

            <Box className="grid grid-cols-2">
                <Box>Phương Tiện</Box>
                <Box>Nhân Viên</Box>
            </Box>
            
            <Box className="grid grid-cols-2">
                <Box>MCPs</Box>
                <Box>Show Route</Box>
            </Box>

            <Box className="grid grid-cols-2">
                <Box>Tạo Nhiệm Vụ</Box>
                <Box>Hủy</Box>
            </Box>
        </Box>
    </Box>
    
  );
};

export default MCPs;
