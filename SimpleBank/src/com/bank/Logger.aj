package com.bank;
import java.io.FileWriter;
import java.io.PrintWriter;
import java.util.Calendar;

public aspect Logger {
	
	pointcut tracedCall():
	call (void moneyMakeTransaction());
	
	after(): tracedCall(){
		int hora, minuto,segundos;
		
		//Aqui code para guardar en log.txt y mostrar en pantalla
		
	    Calendar cal = Calendar.getInstance();
	    hora=cal.get(Calendar.HOUR_OF_DAY);
	    minuto=cal.get(Calendar.MINUTE);
	    segundos= cal.get(Calendar.SECOND);
	    System.out.println("Registra Transaccion: deposito, Hora: "+hora + ":" + minuto + ":" + segundos+"\n");
	    
	    //File file = new File("log.txt");
	    FileWriter fichero = null;
        PrintWriter pw = null;
        try
        {
            fichero = new FileWriter("log.txt",true);
            pw = new PrintWriter(fichero);

            pw.println("Registra Transaccion: deposito, Hora: "+hora + ":" + minuto + ":" + segundos+"\n");

        } catch (Exception e) {
            e.printStackTrace();
        } finally {
           try {
           // Nuevamente aprovechamos el finally para 
           // asegurarnos que se cierra el fichero.
           if (null != fichero)
              fichero.close();
           } catch (Exception e2) {
              e2.printStackTrace();
           }
        }
	    
	}
	
	pointcut tracedCall2():	call (void moneyWithdrawal());
	
	after():tracedCall2(){
		int hora, minuto,segundos;
		
		//Aqui code para guardar en log.txt y mostrar en pantalla
		
	    Calendar cal = Calendar.getInstance();
	    hora=cal.get(Calendar.HOUR_OF_DAY);
	    minuto=cal.get(Calendar.MINUTE);
	    segundos= cal.get(Calendar.SECOND);
	    System.out.println("Registra Transaccion: retiro, Hora: "+hora + ":" + minuto + ":" + segundos+"\n");
	    
	    //File file = new File("log.txt");
	    FileWriter fichero = null;
        PrintWriter pw = null;
        try
        {
            fichero = new FileWriter("log.txt",true);
            pw = new PrintWriter(fichero);

            pw.println("Registra Transaccion: retiro, Hora: "+hora + ":" + minuto + ":" + segundos+"\n");

        } catch (Exception e) {
            e.printStackTrace();
        } finally {
           try {
           // Nuevamente aprovechamos el finally para 
           // asegurarnos que se cierra el fichero.
           if (null != fichero)
              fichero.close();
           } catch (Exception e2) {
              e2.printStackTrace();
           }
        }
		
		
	}
	

}
