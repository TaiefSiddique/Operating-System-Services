#!/bin/bash

while true; do
    echo "Operating System Services Simulation Using Shell Script"
    echo "1. CPU Scheduling Algorithms"
    echo "2. Page Replacement Algorithms"
    echo "3. Contiguous Memory Allocation Algorithms"
    echo "4. Exit"

    read -p "Enter your choice (1-4): " choice

    case $choice in
        1)  # CPU Scheduling Algorithms
            while true; do
                echo "CPU Scheduling Algorithms"
                echo "1. Priority Scheduling"
                echo "2. SJF Scheduling"
                echo "3. FCFS Scheduling"
                echo "4. Back to Main Menu"

                read -p "Enter your choice (1-4): " cpu_choice

                case $cpu_choice in
                    1)  # Priority Scheduling
                        echo "Priority Scheduling Algorithm"

                        # Priority Scheduling Code
                        read -p "Enter the number of processes: " n
                        burst_time=()
                        priority=()
                        waiting_time=()
                        turnaround_time=()
                        process_number=()

                        for ((i = 1; i <= n; i++)); do
                            echo "Enter the burst time for process $i:"
                            read bt
                            burst_time+=("$bt")
                            echo "Enter the priority for process $i:"
                            read pr
                            priority+=("$pr")
                            waiting_time+=("0")
                            turnaround_time+=("0")
                            process_number+=("$i")
                        done

                        # Sort processes by priority, and in case of a tie, by burst time
                        for ((i = 0; i < n; i++)); do
                            for ((j = i + 1; j < n; j++)); do
                                if ((priority[i] > priority[j] || (priority[i] == priority[j] && burst_time[i] > burst_time[j]))); then
                                    tmp=${priority[i]}
                                    priority[i]=${priority[j]}
                                    priority[j]=$tmp
                                    tmp=${burst_time[i]}
                                    burst_time[i]=${burst_time[j]}
                                    burst_time[j]=$tmp
                                    tmp=${process_number[i]}
                                    process_number[i]=${process_number[j]}
                                    process_number[j]=$tmp
                                fi
                            done
                        done

                        # Calculate waiting and turnaround times
                        waiting_time[0]=0
                        for ((i = 1; i < n; i++)); do
                            waiting_time[i]=$((waiting_time[i - 1] + burst_time[i - 1]))
                        done

                        for ((i = 0; i < n; i++)); do
                            turnaround_time[i]=$((waiting_time[i] + burst_time[i]))
                        done

                        # Print the results in the original order
                        echo "Process | Burst Time | Priority | Waiting Time | Turnaround Time"
                        echo "------- | ---------- | -------- | ------------ | --------------"
                        for ((i = 0; i < n; i++)); do
                            echo "P${process_number[i]} | ${burst_time[i]} | ${priority[i]} | ${waiting_time[i]} | ${turnaround_time[i]}"
                        done

                        # Calculate the average waiting time and turnaround time
                        total_waiting_time=0
                        total_turnaround_time=0
                        for ((i = 0; i < n; i++)); do
                            total_waiting_time=$((total_waiting_time + waiting_time[i]))
                            total_turnaround_time=$((total_turnaround_time + turnaround_time[i]))
                        done

                        avg_waiting_time=$(bc -l <<< "scale=2; $total_waiting_time / $n")
                        avg_turnaround_time=$(bc -l <<< "scale=2; $total_turnaround_time / $n")

                        echo "Average Waiting Time: $avg_waiting_time"
                        echo "Average Turnaround Time: $avg_turnaround_time"

                        ;;
                    2)  # SJF Scheduling
                        echo "SJF Scheduling Algorithm"

                        # SJF Scheduling Code
                        read -p "Enter the number of processes: " n
                        burst_time=()
                        waiting_time=()
                        turnaround_time=()
                        process_number=()

                        for ((i = 1; i <= n; i++)); do
                            echo "Enter the burst time for process $i:"
                            read bt
                            burst_time+=("$bt")
                            waiting_time+=("0")
                            turnaround_time+=("0")
                            process_number+=("$i")
                        done

                        # Sort processes by burst time
                        for ((i = 0; i < n; i++)); do
                            for ((j = i + 1; j < n; j++)); do
                                if ((burst_time[i] > burst_time[j])); then
                                    tmp=${burst_time[i]}
                                    burst_time[i]=${burst_time[j]}
                                    burst_time[j]=$tmp
                                    tmp=${process_number[i]}
                                    process_number[i]=${process_number[j]}
                                    process_number[j]=$tmp
                                fi
                            done
                        done

                        # Calculate waiting and turnaround times
                        waiting_time[0]=0
                        for ((i = 1; i < n; i++)); do
                            waiting_time[i]=$((waiting_time[i - 1] + burst_time[i - 1]))
                        done

                        for ((i = 0; i < n; i++)); do
                            turnaround_time[i]=$((waiting_time[i] + burst_time[i]))
                        done

                        # Print the results in the original order
                        echo "Process | Burst Time | Waiting Time | Turnaround Time"
                        echo "------- | ---------- | ------------ | --------------"
                        for ((i = 0; i < n; i++)); do
                            echo "P${process_number[i]} | ${burst_time[i]} | ${waiting_time[i]} | ${turnaround_time[i]}"
                        done

                        # Calculate the average waiting time and turnaround time
                        total_waiting_time=0
                        total_turnaround_time=0
                        for ((i = 0; i < n; i++)); do
                            total_waiting_time=$((total_waiting_time + waiting_time[i]))
                            total_turnaround_time=$((total_turnaround_time + turnaround_time[i]))
                        done

                        avg_waiting_time=$(bc -l <<< "scale=2; $total_waiting_time / $n")
                        avg_turnaround_time=$(bc -l <<< "scale=2; $total_turnaround_time / $n")

                        echo "Average Waiting Time: $avg_waiting_time"
                        echo "Average Turnaround Time: $avg_turnaround_time"

                        ;;
                    3)  # FCFS Scheduling
                        echo "FCFS Scheduling Algorithm"

                        # FCFS Scheduling Code
                        read -p "Enter the number of processes: " n
                        burst_time=()
                        waiting_time=()
                        turnaround_time=()
                        process_number=()

                        for ((i = 1; i <= n; i++)); do
                            echo "Enter the burst time for process $i:"
                            read bt
                            burst_time+=("$bt")
                            waiting_time+=("0")
                            turnaround_time+=("0")
                            process_number+=("$i")
                        done

                        # Calculate waiting and turnaround times
                        waiting_time[0]=0
                        for ((i = 1; i < n; i++)); do
                            waiting_time[i]=$((waiting_time[i - 1] + burst_time[i - 1]))
                        done

                        for ((i = 0; i < n; i++)); do
                            turnaround_time[i]=$((waiting_time[i] + burst_time[i]))
                        done

                        # Print the results in the original order
                        echo "Process | Burst Time | Waiting Time | Turnaround Time"
                        echo "------- | ---------- | ------------ | --------------"
                        for ((i = 0; i < n; i++)); do
                            echo "P${process_number[i]} | ${burst_time[i]} | ${waiting_time[i]} | ${turnaround_time[i]}"
                        done

                        # Calculate the average waiting time and turnaround time
                        total_waiting_time=0
                        total_turnaround_time=0
                        for ((i = 0; i < n; i++)); do
                            total_waiting_time=$((total_waiting_time + waiting_time[i]))
                            total_turnaround_time=$((total_turnaround_time + turnaround_time[i]))
                        done

                        avg_waiting_time=$(bc -l <<< "scale=2; $total_waiting_time / $n")
                        avg_turnaround_time=$(bc -l <<< "scale=2; $total_turnaround_time / $n")

                        echo "Average Waiting Time: $avg_waiting_time"
                        echo "Average Turnaround Time: $avg_turnaround_time"

                        ;;
                    4)  # Back to Main Menu
                        break
                        ;;
                    *)  # Invalid Choice
                        echo "Invalid choice. Please enter a valid option."
                        ;;
                esac
            done
            ;;
        2)  # Page Replacement Algorithms
            while true; do
                echo "Page Replacement Algorithms"
                echo "1. FIFO"
                echo "2. LRU"
                echo "3. LFU"
                echo "4. OPR"
                echo "5. Back to Main Menu"

                read -p "Enter your choice (1-5): " page_choice

                case $page_choice in
                    1)  # FIFO
                        echo "FIFO Page Replacement Algorithm"

                        # FIFO Page Replacement Code
                        read -p "Enter the number of frames: " frames
                        read -p "Enter the number of pages: " pages
                        page_array=()

                        for ((i = 1; i <= pages; i++)); do
                            echo "Enter the page number for reference $i:"
                            read page
                            page_array+=("$page")
                        done

                        fifo_replace=()
                        page_faults=0

                        for ((i = 0; i < frames; i++)); do
                            fifo_replace+=("-1")
                        done

                        for ((i = 0; i < pages; i++)); do
                            page_number=${page_array[i]}
                            page_found=false

                            for ((j = 0; j < frames; j++)); do
                                if [ "${fifo_replace[j]}" -eq "$page_number" ]; then
                                    page_found=true
                                    break
                                fi
                            done

                            if [ "$page_found" == false ]; then
                                replace_index=$((i % frames))
                                fifo_replace[$replace_index]=$page_number
                                page_faults=$((page_faults + 1))
                            fi
                        done

                        echo "Page Faults using FIFO: $page_faults"

                        ;;
                    2)  # LRU
                        echo "LRU Page Replacement Algorithm"

                        # LRU Page Replacement Code
                        read -p "Enter the number of frames: " frames
                        read -p "Enter the number of pages: " pages
                        page_array=()

                        for ((i = 1; i <= pages; i++)); do
                            echo "Enter the page number for reference $i:"
                            read page
                            page_array+=("$page")
                        done

                        lru_replace=()
                        page_faults=0

                        for ((i = 0; i < frames; i++)); do
                            lru_replace+=("-1")
                        done

                        for ((i = 0; i < pages; i++)); do
                            page_number=${page_array[i]}
                            page_found=false

                            for ((j = 0; j < frames; j++)); do
                                if [ "${lru_replace[j]}" -eq "$page_number" ]; then
                                    page_found=true
                                    unset lru_replace[$j]
                                    lru_replace+=("$page_number")
                                    break
                                fi
                            done

                            if [ "$page_found" == false ]; then
                                if [ "${#lru_replace[@]}" -eq "$frames" ]; then
                                    unset lru_replace[0]
                                    lru_replace+=("$page_number")
                                    page_faults=$((page_faults + 1))
                                else
                                    lru_replace+=("$page_number")
                                    page_faults=$((page_faults + 1))
                                fi
                            fi
                        done

                        echo "Page Faults using LRU: $page_faults"

                        ;;
                    3)  # LFU
                        echo "LFU Page Replacement Algorithm"

                        # LFU Page Replacement Code
                        read -p "Enter the number of frames: " frames
                        read -p "Enter the number of pages: " pages
                        page_array=()

                        for ((i = 1; i <= pages; i++)); do
                            echo "Enter the page number for reference $i:"
                            read page
                            page_array+=("$page")
                        done

                        lfu_count=()
                        lfu_replace=()
                        page_faults=0

                        for ((i = 0; i < frames; i++)); do
                            lfu_count+=("0")
                            lfu_replace+=("-1")
                        done

                        for ((i = 0; i < pages; i++)); do
                            page_number=${page_array[i]}
                            page_found=false

                            for ((j = 0; j < frames; j++)); do
                                if [ "${lfu_replace[j]}" -eq "$page_number" ]; then
                                    page_found=true
                                    lfu_count[j]=$((lfu_count[j] + 1))
                                    break
                                fi
                            done

                            if [ "$page_found" == false ]; then
                                replace_index=0
                                min_count=${lfu_count[0]}

                                for ((j = 1; j < frames; j++)); do
                                    if [ "${lfu_count[j]}" -lt "$min_count" ]; then
                                        min_count=${lfu_count[j]}
                                        replace_index=$j
                                    fi
                                done

                                lfu_replace[$replace_index]=$page_number
                                lfu_count[$replace_index]=1
                                page_faults=$((page_faults + 1))
                            fi
                        done

                        echo "Page Faults using LFU: $page_faults"

                        ;;
                    4)  # OPR (Optimal Page Replacement)
                         
         echo "LFU Page Replacement Algorithm"
                        # Replacement Code for OPR
                        read -p "Enter the number of frames: " frames
                        read -p "Enter the number of pages: " pages
                        page_array=()

                        for ((i = 1; i <= pages; i++)); do
                            echo "Enter the page number for reference $i:"
                            read page
                            page_array+=("$page")
                        done

                        opr_replace=()
                        page_faults=0

                        for ((i = 0; i < frames; i++)); do
                            opr_replace+=("-1")
                        done

                        for ((i = 0; i < pages; i++)); do
                            page_number=${page_array[i]}
                            page_found=false

                            for ((j = 0; j < frames; j++)); do
                                if [ "${opr_replace[j]}" -eq "$page_number" ]; then
                                    page_found=true
                                    break
                                fi
                            done

                            if [ "$page_found" == false ]; then
                                if [ "${#opr_replace[@]}" -eq "$frames" ]; then
                                    max_future_distance=-1
                                    replace_index=0

                                    for ((j = 0; j < frames; j++)); do
                                        current_page=${opr_replace[j]}
                                        future_distance=$(echo ${page_array[@]:$i} | grep -o $current_page | awk '{print $1}')

                                        if [ -z "$future_distance" ]; then
                                            replace_index=$j
                                            break
                                        fi

                                        if [ "$future_distance" -gt "$max_future_distance" ]; then
                                            max_future_distance=$future_distance
                                            replace_index=$j
                                        fi
                                    done

                                    opr_replace[$replace_index]=$page_number
                                    page_faults=$((page_faults + 1))
                                else
                                    opr_replace+=("$page_number")
                                    page_faults=$((page_faults + 1))
                                fi
                            fi
                        done

                        echo "Page Faults using OPR: $page_faults"

                        ;;
                    5)  # Back to Main Menu
                        break
                        ;;
                    *)  # Invalid Choice
                        echo "Invalid choice. Please enter a valid option."
                        ;;
                esac
            done
            ;;
        3)  # Contiguous Memory Allocation Algorithms
            while true; do
                echo "Contiguous Memory Allocation Algorithms"
                echo "1. First Fit"
                echo "2. Best Fit"
                echo "3. Worst Fit"
                echo "4. Next Fit"
                echo "5. Contiguous Memory Allocation with Paging"
                echo "6. Back to Main Menu"

                read -p "Enter your choice (1-6): " mem_choice

                case $mem_choice in
                    1)  # First Fit
                        echo "First Fit Contiguous Memory Allocation Algorithm"

                        # First Fit Code Here
                        read -p "Enter the total memory size: " total_memory
                        read -p "Enter the number of processes: " num_processes
                        memory_blocks=()
                        process_sizes=()

                        for ((i = 1; i <= num_processes; i++)); do
                            echo "Enter the size of process $i:"
                            read size
                            process_sizes+=("$size")
                        done

                        current_position=0
                        allocated_blocks=()

                        for ((i = 0; i < num_processes; i++)); do
                            if ((current_position + process_sizes[i] <= total_memory)); then
                                allocated_blocks+=("$current_position")
                                current_position=$((current_position + process_sizes[i]))
                                echo "Process $((i + 1)) allocated at position $current_position"
                            else
                                echo "Insufficient memory for Process $((i + 1))"
                            fi
                        done

                        ;;
                    2)  # Best Fit
                        echo "Best Fit Contiguous Memory Allocation Algorithm"

                        # Best Fit Code Here
                        read -p "Enter the total memory size: " total_memory
                        read -p "Enter the number of processes: " num_processes
                        memory_blocks=()
                        process_sizes=()

                        for ((i = 1; i <= num_processes; i++)); do
                            echo "Enter the size of process $i:"
                            read size
                            process_sizes+=("$size")
                        done

                        allocated_blocks=()

                        for ((i = 0; i < num_processes; i++)); do
                            best_fit=-1
                            best_fit_index=-1

                            for ((j = 0; j < ${#allocated_blocks[@]}; j++)); do
                                if ((allocated_blocks[j] >= process_sizes[i])); then
                                    if ((best_fit == -1 || allocated_blocks[j] < best_fit)); then
                                        best_fit=${allocated_blocks[j]}
                                        best_fit_index=$j
                                    fi
                                fi
                            done

                            if ((best_fit_index != -1)); then
                                allocated_blocks[best_fit_index]=$((allocated_blocks[best_fit_index] - process_sizes[i]))
                                echo "Process $((i + 1)) allocated at position $best_fit"
                            else
                                echo "Insufficient memory for Process $((i + 1))"
                            fi
                        done

                        ;;
                    3)  # Worst Fit
                        echo "Worst Fit Contiguous Memory Allocation Algorithm"

                        # Worst Fit Code Here
                        read -p "Enter the total memory size: " total_memory
                        read -p "Enter the number of processes: " num_processes
                        memory_blocks=()
                        process_sizes=()

                        for ((i = 1; i <= num_processes; i++)); do
                            echo "Enter the size of process $i:"
                            read size
                            process_sizes+=("$size")
                        done

                        allocated_blocks=()

                        for ((i = 0; i < num_processes; i++)); do
                            worst_fit=-1
                            worst_fit_index=-1

                            for ((j = 0; j < ${#allocated_blocks[@]}; j++)); do
                                if ((allocated_blocks[j] >= process_sizes[i])); then
                                    if ((worst_fit == -1 || allocated_blocks[j] > worst_fit)); then
                                        worst_fit=${allocated_blocks[j]}
                                        worst_fit_index=$j
                                    fi
                                fi
                            done

                            if ((worst_fit_index != -1)); then
                                allocated_blocks[best_fit_index]=$((allocated_blocks[worst_fit_index] - process_sizes[i]))
                                echo "Process $((i + 1)) allocated at position $worst_fit"
                            else
                                echo "Insufficient memory for Process $((i + 1))"
                            fi
                        done

                        ;;
                    4)  # Next Fit
                        echo "Next Fit Contiguous Memory Allocation Algorithm"

                        # Next Fit Code Here
                        read -p "Enter the total memory size: " total_memory
                        read -p "Enter the number of processes: " num_processes
                        memory_blocks=()
                        process_sizes=()

                        for ((i = 1; i <= num_processes; i++)); do
                            echo "Enter the size of process $i:"
                            read size
                            process_sizes+=("$size")
                        done

                        current_position=0
                        allocated_blocks=()

                        for ((i = 0; i < num_processes; i++)); do
                            if ((current_position + process_sizes[i] <= total_memory)); then
                                allocated_blocks+=("$current_position")
                                current_position=$((current_position + process_sizes[i]))
                                echo "Process $((i + 1)) allocated at position $current_position"
                            else
                                echo "Insufficient memory for Process $((i + 1))"
                            fi
                        done

                        ;;
                    5)  # Contiguous Memory Allocation with Paging
                        echo "Contiguous Memory Allocation with Paging Algorithm"

                        # Paging Code Here
                        read -p "Enter the total memory size: " total_memory
                        read -p "Enter the page size: " page_size
                        read -p "Enter the number of processes: " num_processes
                        process_sizes=()

                        for ((i = 1; i <= num_processes; i++)); do
                            echo "Enter the size of process $i:"
                            read size
                            process_sizes+=("$size")
                        done

                        pages_per_process=()
                        total_frames=$((total_memory / page_size))
                        allocated_frames=()

                        for ((i = 0; i < num_processes; i++)); do
                            pages_per_process[i]=$((process_sizes[i] / page_size))
                        done

                        for ((i = 0; i < num_processes; i++)); do
                            if ((total_frames >= pages_per_process[i])); then
                                allocated_frames+=("${pages_per_process[i]}")
                                total_frames=$((total_frames - pages_per_process[i]))
                                echo "Process $((i + 1)) allocated ${pages_per_process[i]} frames"
                            else
                                echo "Insufficient memory for Process $((i + 1))"
                            fi
                        done

                        ;;
                    6)  # Back to Main Menu
                        break
                        ;;
                    *)  # Invalid Choice
                        echo "Invalid choice. Please enter a valid option."
                        ;;
                esac
            done
            ;;
        4)  # Exit
            echo "Exiting the simulation. Goodbye!"
            exit 0
            ;;
        *)  # Invalid Choice
            echo "Invalid choice. Please enter a valid option."
            ;;
    esac
done


