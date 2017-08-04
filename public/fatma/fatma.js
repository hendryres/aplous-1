var IndonesianFormat = {
    shortMonth: function(idx){
        var bulan = ['', 'Jan', 'Feb', 'Mar', 'Apr', 'Mei', 'Jun', 'Jul', 'Agu', 'Sep', 'Okt', 'Nov', 'Des'];
        return bulan[idx];
    },
    longMonth: function(idx){
        var bulan = ['', 'Januari', 'Februari', 'Maret', 'April', 'Mei', 'Juni', 'Juli', 'Agustus', 'September', 'Oktober', 'November', 'Desember'];
        return bulan[idx];
    },
    shortDay: function(idx){
        var hari = ['', 'Min', 'Sen', 'Sel', 'Rab', 'Kam', 'Jum', 'Sab'];
        return hari[idx];
    },
    longDay: function(idx){
        var hari = ['', 'Minggu', 'Senin', 'Selasa', 'Rabu', 'Kamis', 'Jumat', 'Sabtu'];
        return hari[idx];
    },
    date: function(inDateTime, format){
        
        var procDateTimeObj;
        if (inDateTime.match(/^\d{4}-\d{2}-\d{2} \d{2}\:\d{2}\:\d{2}$/)) {
            inDateTime = inDateTime.replace(/ /g, 'T');
            procDateTimeObj = new Date(inDateTime);
        } else if (inDateTime.match(/^\d{4}-\d{2}-\d{2}T\d{2}\:\d{2}\:\d{2}$/)) {
            procDateTimeObj = new Date(inDateTime);
        } else if (inDateTime.match(/^\d{4}-\d{2}-\d{2}$/)) {
            inDateTime = inDateTime + "T00:00:00";
            //console.log(inDateTime);
            procDateTimeObj = new Date(inDateTime);
        }
        
        var strBuilder = '';
        
        //console.log(procDateTimeObj);
        
        if (!isNaN(procDateTimeObj.getHours())) {
            var retDate = {
                Y: procDateTimeObj.getUTCFullYear().toString(),
                y: procDateTimeObj.getUTCFullYear().toString().substr(2, 2),
                //Y: procDateTimeObj.getFullYear().toString(),
                //y: procDateTimeObj.getFullYear().toString().substr(2, 2),

                F: this.longMonth(procDateTimeObj.getUTCMonth() + 1),
                M: this.shortMonth(procDateTimeObj.getUTCMonth() + 1),
                m: Util.zeroPad(procDateTimeObj.getUTCMonth() + 1, 2),
                n: (procDateTimeObj.getUTCMonth() + 1).toString(),
                //F: this.longMonth(procDateTimeObj.getMonth() + 1),
                //M: this.shortMonth(procDateTimeObj.getMonth() + 1),
                //m: Util.zeroPad(procDateTimeObj.getMonth() + 1, 2),
                //n: (procDateTimeObj.getMonth() + 1).toString(),
                
                d: Util.zeroPad(procDateTimeObj.getUTCDate(), 2),
                D: this.shortDay(procDateTimeObj.getUTCDay()),
                j: (procDateTimeObj.getUTCDate()).toString(),
                l: this.longDay(procDateTimeObj.getUTCDay()),
                N: (procDateTimeObj.getUTCDay()).toString(),
                w: procDateTimeObj.getUTCDay().toString(),
                //d: Util.zeroPad(procDateTimeObj.getDate(), 2),
                //D: this.shortDay(procDateTimeObj.getDay()),
                //j: (procDateTimeObj.getDate()).toString(),
                //l: this.longDay(procDateTimeObj.getDay()),
                //N: (procDateTimeObj.getDay()).toString(),
                //w: procDateTimeObj.getDay().toString(),
                
                G: (procDateTimeObj.getUTCHours() + 1).toString(),
                H: Util.zeroPad(procDateTimeObj.getUTCHours(), 2),
                i: Util.zeroPad(procDateTimeObj.getUTCMinutes(), 2),
                s: Util.zeroPad(procDateTimeObj.getUTCSeconds(), 2),
                //G: (procDateTimeObj.getHours() + 1).toString(),
                //H: Util.zeroPad(procDateTimeObj.getHours(), 2),
                //i: Util.zeroPad(procDateTimeObj.getMinutes(), 2),
                //s: Util.zeroPad(procDateTimeObj.getSeconds(), 2),
            };
            for (var x = 0; x < format.length; x++) {
                var c = format.charAt(x);
                if (retDate[c] !== undefined) {
                    strBuilder = strBuilder + retDate[c];
                } else {
                    strBuilder = strBuilder + c;
                }
            }
            
        }
        return strBuilder;
    }
};

var Util = {
    zeroPad: function(num, places) {
        var zero = places - num.toString().length + 1;
        return Array(+(zero > 0 && zero)).join("0") + num;
    }
}