package T1_Eng_Soft;

public class BuscaElemento {
    int[] lista = {19, 27, 49, 33, 1, 0, 77, 39823, 000, 3};

    /* Morgana Luiza Weber - 20103601 */
    public boolean buscaElemMorgana(int i){
        for(int j = 0; j<lista.length; j++){
            if(lista[j] == i) return true;
        }
        return false;
    }
}
